import 'package:dongi/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/box_model.dart';
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
      expenseAPI: ref.watch(expenseAPIProvider),
      storageAPI: ref.watch(storageAPIProvider),
      ref: ref,
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

final getBoxesProvider = FutureProvider((ref) {
  final boxesController = ref.watch(expenseNotifierProvider.notifier);
  return boxesController.getBoxes();
});

final getBoxesInGroupProvider =
    FutureProvider.family.autoDispose((ref, String groupId) {
  final boxesController = ref.watch(expenseNotifierProvider.notifier);
  return boxesController.getBoxesInGroup(groupId);
});

//final getBoxDetailProvider =
//    FutureProvider.family.autoDispose((ref, String boxId) {
//  final boxesController = ref.watch(expenseNotifierProvider.notifier);
//  return boxesController.getBoxDetail(boxId);
//});

final getUsersInBoxProvider =
    FutureProvider.family.autoDispose((ref, List<String> userIds) {
  final boxesController = ref.watch(expenseNotifierProvider.notifier);
  return boxesController.getUsersInBox(userIds);
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

final splitCostProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController(text: "0");
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
    required String groupId,
    required String boxId,
  }) async {
    state = const ExpenseState.loading();
    final currentUser = ref.read(currentUserProvider);
    final creatorUserId = ref.read(expenseCreatorProvider);
    final splitCost = ref.read(splitCostProvider);
    final splitUser = ref.read(splitUserProvider.notifier);

    ExpenseModel expenseModel = ExpenseModel(
      title: expenseTitle.text,
      description: expenseDescription.text,
      boxId: boxId,
      groupId: groupId,
      creatorId: creatorUserId ?? currentUser!.$id,
      //equal: equal,
      cost: int.parse(splitCost.text),
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
    required String groupId,
    required String boxId,
  }) async {
    state = const ExpenseState.loading();
    final currentUser = ref.read(currentUserProvider);
    final creatorUserId = ref.read(expenseCreatorProvider);
    final splitCost = ref.read(splitCostProvider);
    final splitUser = ref.read(splitUserProvider.notifier);

    ExpenseModel expenseModel = ExpenseModel(
      title: expenseTitle.text,
      description: expenseDescription.text,
      boxId: boxId,
      groupId: groupId,
      creatorId: creatorUserId ?? currentUser!.$id,
      //equal: equal,
      cost: int.parse(splitCost.text),
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

  Future<List<BoxModel>> getBoxes() async {
    final user = ref.read(currentUserProvider);
    final boxList = await expenseAPI.getExpenses(user!.$id);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }

  Future<List<BoxModel>> getBoxesInGroup(String groupId) async {
    final boxList = await expenseAPI.getExpensesInGroup(groupId);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }

  Future<BoxModel> getBoxDetail(String boxId) async {
    final box = await expenseAPI.getExpenseDetail(boxId);
    return BoxModel.fromJson(box.data);
  }

  Future<List<UserModel>> getUsersInBox(List<String> userIds) async {
    final users = await expenseAPI.getUsersInExpense(userIds);
    return users.map((user) => UserModel.fromJson(user.data)).toList();
  }

  Future<List<BoxModel>> getCurrentUserBoxes() async {
    final user = ref.read(currentUserProvider);
    final boxList = await expenseAPI.getExpensesInGroup(user!.$id);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
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
