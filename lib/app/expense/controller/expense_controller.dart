import 'package:appwrite/appwrite.dart';
import 'package:collection/collection.dart';
import 'package:dongi/models/expense_user_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../models/box_model.dart';
import '../../../models/expense_model.dart';
import '../../../models/group_model.dart';
import '../../../services/expense_service.dart';
import '../../../services/storage_api.dart';
import '../../auth/controller/auth_controller.dart';
import '../../box/controller/box_controller.dart';
part 'expense_controller.freezed.dart';

final expenseNotifierProvider =
    StateNotifierProvider<ExpenseNotifier, ExpenseState>(
  (ref) {
    return ExpenseNotifier(
      ref: ref,
      expenseAPI: ref.watch(expenseAPIProvider),
      storageAPI: ref.watch(storageAPIProvider),
    );
  },
);

@freezed
class ExpenseState with _$ExpenseState {
  const factory ExpenseState.init() = ExpenseInitState;
  const factory ExpenseState.loading() = ExpenseLoadingState;
  const factory ExpenseState.loaded() = ExpenseLoadedState;
  const factory ExpenseState.error(String message) = ExpenseErrorState;
}

final getExpensesInBoxProvider =
    FutureProvider.family.autoDispose((ref, String boxId) {
  final expenseController = ref.watch(expenseNotifierProvider.notifier);
  return expenseController.getExpensesInBox(boxId);
});

final getExpensesDetailProvider =
    FutureProvider.family.autoDispose((ref, String expenseId) {
  final expenseController = ref.watch(expenseNotifierProvider.notifier);
  return expenseController.getExpenseDetail(expenseId);
});

final expenseCreatorProvider = StateProvider<String?>((ref) {
  final user = ref.read(currentUserProvider);
  return user?.$id;
});

final splitUserProvider =
    StateNotifierProvider<SplitUserNotifier, List<String>>((ref) {
  final allUsers = ref.watch(userInBoxStoreProvider);
  return SplitUserNotifier(allUsers.map((e) => e.id!).toList());
});

class ExpenseNotifier extends StateNotifier<ExpenseState> {
  ExpenseNotifier({
    required this.ref,
    required this.expenseAPI,
    required this.storageAPI,
  }) : super(const ExpenseState.init());

  final Ref ref;
  final ExpenseAPI expenseAPI;
  final StorageAPI storageAPI;

  Future<void> addExpense({
    required TextEditingController expenseTitle,
    required TextEditingController expenseDescription,
    required TextEditingController expenseCost,
    required BoxModel boxModel,
    required GroupModel groupModel,
  }) async {
    state = const ExpenseState.loading();
    final currentUser = ref.read(currentUserProvider);
    final creatorUserId = ref.read(expenseCreatorProvider);
    final splitUser = ref.read(splitUserProvider.notifier);
    num convertedCost = num.parse(expenseCost.text.replaceAll(',', ''));
    //Because it must be added in the expenseUser,
    //we create it ourselves in here(the client side)
    String expenseId = ID.custom(const Uuid().v4().substring(0, 32));
    List<String> expenseUserIds = [];

    for (var uid in splitUser.state) {
      String expenseUserId = ID.custom(const Uuid().v4().substring(0, 32));
      expenseUserIds.add(expenseUserId);
      ExpenseUserModel expenseUser = ExpenseUserModel(
        userId: uid,
        groupId: groupModel.id!,
        boxId: boxModel.id!,
        expenseId: expenseId,
        cost: convertedCost / splitUser.state.length,
      );
      await addExpenseUser(expenseUser, customId: expenseUserId);
    }

    ExpenseModel expenseModel = ExpenseModel(
      title: expenseTitle.text,
      description: expenseDescription.text,
      boxId: boxModel.id!,
      groupId: groupModel.id!,
      creatorId: creatorUserId ?? currentUser!.$id,
      //equal: equal,
      cost: convertedCost,
      expenseUsers: expenseUserIds,
    );

    final res = await expenseAPI.addExpense(expenseModel, customId: expenseId);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) {
        // Add new expense data to Box
        //TODO: If error occured in this step app should remember to call this later
        ref.read(boxNotifierProvider.notifier).updateBox(
          boxId: boxModel.id!,
          total: boxModel.total + expenseModel.cost,
          expenseIds: [...boxModel.expenseIds, r.$id],
        );

        return const ExpenseState.loaded();
      },
    );
  }

  Future<void> updateExpense({
    required ExpenseModel expenseModel,
    required GroupModel groupModel,
    required BoxModel boxModel,
    TextEditingController? expenseTitle,
    TextEditingController? expenseDescription,
    TextEditingController? expenseCost,
  }) async {
    state = const ExpenseState.loading();
    Map<String, dynamic> updateData = {};
    num totalBoxCost = boxModel.total;

    final currentUser = ref.read(currentUserProvider);
    final splitUser = ref.read(splitUserProvider.notifier);
    final creatorUserId = ref.read(expenseCreatorProvider);

    updateData["\$id"] = expenseModel.id;
    updateData["creatorId"] = creatorUserId ?? currentUser!.$id;

    //ExpenseModel expenseModel = ExpenseModel(
    //  id: expenseId,
    //  title: expenseTitle.text,
    //  description: expenseDescription.text,
    //  boxId: boxId,
    //  groupId: groupId,
    //  creatorId: creatorUserId ?? currentUser!.$id,
    //  //equal: equal,
    //  cost: int.parse(expenseCost.text),
    //  expenseUsers: splitUser.state,
    //);

    if (expenseTitle != null && expenseTitle.text.isNotEmpty) {
      // Add expenseTitle to the update data
      updateData['title'] = expenseTitle.text;
    }

    if (expenseDescription != null && expenseDescription.text.isNotEmpty) {
      // Add expenseDescription to the update data
      updateData['description'] = expenseDescription.text;
    }

    if (expenseCost != null && expenseCost.text.isNotEmpty) {
      // Add expenseCost to the update data
      // Convert the expenseCost to a num
      num cost = num.parse(expenseCost.text.replaceAll(',', ''));
      updateData['cost'] = cost;
      totalBoxCost = totalBoxCost - expenseModel.cost + cost;
    }

    //Update All ExpenseUsers
    num cost = (updateData['cost'] ?? expenseModel.cost);
    if (!splitUser.state.equals(expenseModel.expenseUsers) ||
        cost != expenseModel.cost) {
      List<String> expenseUserIds = [];

      // Delete all the expenseUserModels and create them again with new data
      for (var eUid in expenseModel.expenseUsers) {
        await deleteExpenseUser(eUid);
      }

      for (var uid in splitUser.state) {
        String expenseUserId = ID.custom(const Uuid().v4().substring(0, 32));
        expenseUserIds.add(expenseUserId);
        ExpenseUserModel expenseUser = ExpenseUserModel(
          userId: uid,
          groupId: groupModel.id!,
          boxId: boxModel.id!,
          expenseId: expenseModel.id!,
          cost: cost / splitUser.state.length,
        );
        await addExpenseUser(expenseUser, customId: expenseUserId);
      }

      updateData["expenseUsers"] = expenseUserIds;
    }

    final res = await expenseAPI.updateExpense(updateData);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) {
        // Add new expense data to Box
        ref.read(boxNotifierProvider.notifier).updateBox(
              boxId: boxModel.id!,
              total: totalBoxCost,
            );

        return const ExpenseState.loaded();
      },
    );
  }

  Future<void> deleteExpense({
    required ExpenseModel expenseModel,
    required BoxModel boxModel,
  }) async {
    state = const ExpenseState.loading();
    //remove box from server
    final res = await expenseAPI.deleteExpense(expenseModel.id!);

    // Delete all the expenseUserModels
    for (var eUid in expenseModel.expenseUsers) {
      await deleteExpenseUser(eUid);
    }

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) {
        // Add new expense data to Box
        ref.read(boxNotifierProvider.notifier).updateBox(
              boxId: boxModel.id!,
              total: boxModel.total - expenseModel.cost,
              expenseIds: boxModel.expenseIds
                  .where((val) => val != expenseModel.id)
                  .toList(),
            );

        return const ExpenseState.loaded();
      },
    );
  }

  Future<void> deleteAllExpense(List<String> ids) async {
    state = const ExpenseState.loading();
    //remove box from server
    //TODO: I should remove expenses too
    final res = await expenseAPI.deleteAllExpense(ids);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) => const ExpenseState.loaded(),
    );
  }

  Future<void> addExpenseUser(
    ExpenseUserModel expenseUser, {
    required String customId,
  }) async {
    //state = const ExpenseState.loading();
    final res = await expenseAPI.addExpenseUser(
      expenseUser,
      customId: customId,
    );

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) => state,
    );
  }

  Future<void> deleteExpenseUser(String id) async {
    //state = const ExpenseState.loading();
    final res = await expenseAPI.deleteExpenseUser(id);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) => state,
    );
  }

  Future<List<ExpenseModel>> getExpensesInBox(String boxId) async {
    final expenseList = await expenseAPI.getExpensesInBox(boxId);
    return expenseList.map((box) => ExpenseModel.fromJson(box.data)).toList();
  }

  Future<ExpenseModel> getExpenseDetail(String expenseId) async {
    final expense = await expenseAPI.getExpenseDetail(expenseId);
    return ExpenseModel.fromJson(expense.data);
  }
}

class SplitUserNotifier extends StateNotifier<List<String>> {
  SplitUserNotifier(super.state);

  //final List<String> users;
  //SplitUserNotifier(this.users) : super(users);

  //List<String> getIds() {
  //  return state.map((val) => val.id!).toList();
  //}

  void select(String userId) {
    if (state.map((val) => val).toList().contains(userId)) {
      state = state.where((val) => val != userId).toList();
    } else {
      state = [...state, userId];
    }
  }

  void addAll(List<String> userIds) {
    if (state.length == userIds.length) {
      state = [];
    } else {
      state = userIds;
    }
  }
}
