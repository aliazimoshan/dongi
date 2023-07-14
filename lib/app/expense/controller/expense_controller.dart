import 'package:dongi/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/user_model.dart';
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

final expenseCreatorProvider = StateProvider<String?>((ref) {
  final user = ref.read(currentUserProvider);
  return user?.$id;
});

final splitUserProvider =
    StateNotifierProvider<SplitUserNotifier, List<UserModel>>((ref) {
  final allUsers = ref.watch(userInBoxStoreProvider);
  return SplitUserNotifier(allUsers);
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
    required String groupId,
    required String boxId,
  }) async {
    state = const ExpenseState.loading();
    final currentUser = ref.read(currentUserProvider);
    final creatorUserId = ref.read(expenseCreatorProvider);
    final splitUser = ref.read(splitUserProvider.notifier);

    ExpenseModel expenseModel = ExpenseModel(
      title: expenseTitle.text,
      description: expenseDescription.text,
      boxId: boxId,
      groupId: groupId,
      creatorId: creatorUserId ?? currentUser!.$id,
      //equal: equal,
      cost: int.parse(expenseCost.text),
      expenseUsers: splitUser.getIds(),
    );

    final res = await expenseAPI.addExpense(expenseModel);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) => const ExpenseState.loaded(),
    );
  }

  Future<void> updateBox({
    required TextEditingController expenseTitle,
    required TextEditingController expenseDescription,
    required TextEditingController expenseCost,
    required String groupId,
    required String boxId,
  }) async {
    state = const ExpenseState.loading();
    final currentUser = ref.read(currentUserProvider);
    final creatorUserId = ref.read(expenseCreatorProvider);
    final splitUser = ref.read(splitUserProvider.notifier);

    ExpenseModel expenseModel = ExpenseModel(
      title: expenseTitle.text,
      description: expenseDescription.text,
      boxId: boxId,
      groupId: groupId,
      creatorId: creatorUserId ?? currentUser!.$id,
      //equal: equal,
      cost: int.parse(expenseCost.text),
      expenseUsers: splitUser.getIds(),
    );

    final res = await expenseAPI.addExpense(expenseModel);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) => const ExpenseState.loaded(),
    );
  }

  Future<void> deleteBox(ExpenseModel expenseModel) async {
    state = const ExpenseState.loading();
    //remove box from server
    final res = await expenseAPI.updateExpense(expenseModel);

    state = res.fold(
      (l) => ExpenseState.error(l.message),
      (r) => const ExpenseState.loaded(),
    );
  }

  Future<List<ExpenseModel>> getExpensesInBox(String boxId) async {
    final expenseList = await expenseAPI.getExpensesInBox(boxId);
    return expenseList.map((box) => ExpenseModel.fromJson(box.data)).toList();
  }
}

class SplitUserNotifier extends StateNotifier<List<UserModel>> {
  final List<UserModel> users;
  SplitUserNotifier(this.users) : super(users);

  List<String> getIds() {
    return state.map((val) => val.id!).toList();
  }

  void select(UserModel user) {
    if (state.map((val) => val.id).toList().contains(user.id)) {
      state = state.where((val) => val.id != user.id).toList();
    } else {
      state = [...state, user];
    }
  }

  void addAll(List<UserModel> users) {
    if (state.length == users.length) {
      state = [];
    } else {
      state = users;
    }
  }
}
