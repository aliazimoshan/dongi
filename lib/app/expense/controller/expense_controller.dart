import 'dart:io';
import 'package:dongi/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/box_model.dart';
import '../../../models/user_model.dart';
import '../../../services/expense_service.dart';
import '../../../services/storage_api.dart';
import '../../auth/controller/auth_controller.dart';
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

final getBoxDetailProvider =
    FutureProvider.family.autoDispose((ref, String boxId) {
  final boxesController = ref.watch(expenseNotifierProvider.notifier);
  return boxesController.getBoxDetail(boxId);
});

final getUsersInBoxProvider =
    FutureProvider.family.autoDispose((ref, List<String> userIds) {
  final boxesController = ref.watch(expenseNotifierProvider.notifier);
  return boxesController.getUsersInBox(userIds);
});

//final refreshBoxesProvider =
//    FutureProvider.family.autoDispose((ref, String groupId) {
//  final boxesController = ref.refresh(expenseNotifierProvider.notifier);
//  return boxesController.getBoxesInGroup(groupId);
//});

class ExpenseNotifier extends StateNotifier<ExpenseState> {
  ExpenseNotifier({
    required this.ref,
    required this.expenseAPI,
    required this.storageAPI,
  }) : super(const ExpenseState.init());

  final Ref ref;
  final ExpenseAPI expenseAPI;
  final StorageAPI storageAPI;

  Future<void> addBox({
    required ValueNotifier<File?> image,
    required TextEditingController boxTitle,
    required TextEditingController boxDescription,
    required String groupId,
  }) async {
    state = const ExpenseState.loading();
    final currentUser = await ref.watch(currentUserProvider);
    List<String> imageLinks = [];
    if (image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => ExpenseState.error(l.message),
        (r) => imageLinks = r,
      );
    }

    //BoxModel boxModel = BoxModel(
    //  title: boxTitle.text,
    //  description: boxDescription.text,
    //  creatorId: currentUser!.$id,
    //  groupId: groupId,
    //  image: imageLinks.isNotEmpty ? imageLinks[0] : null,
    //  boxUsers: [currentUser.$id],
    //  total: 0,
    //);

    //final res = await expenseAPI.addExpense(boxModel);

    //state = res.fold(
    //  (l) => ExpenseState.error(l.message),
    //  (r) => const ExpenseState.loaded(),
    //);
  }

  Future<void> updateBox({
    required ValueNotifier<File?> image,
    required TextEditingController boxTitle,
    required TextEditingController boxDescription,
    required BoxModel boxModel,
  }) async {
    state = const ExpenseState.loading();
    //final currentUser = await ref.watch(currentUserProvider);
    List<String> imageLinks = [];
    if (image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => ExpenseState.error(l.message),
        (r) => imageLinks = r,
      );
    }
    //BoxModel newBoxModel = BoxModel(
    //  id: boxModel.id,
    //  title: boxTitle.text,
    //  description: boxDescription.text,
    //  creatorId: boxModel.creatorId,
    //  groupId: boxModel.groupId,
    //  image: imageLinks.isNotEmpty ? imageLinks[0] : boxModel.image,
    //);

    //final res = await expenseAPI.updateExpense(newBoxModel);

    //state = res.fold(
    //  (l) => ExpenseState.error(l.message),
    //  (r) => const ExpenseState.loaded(),
    //);
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
    final user = await ref.watch(currentUserProvider);
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
    final user = await ref.watch(currentUserProvider);
    final boxList = await expenseAPI.getExpensesInGroup(user!.$id);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }
}
