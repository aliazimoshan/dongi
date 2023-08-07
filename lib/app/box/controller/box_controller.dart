import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/box_model.dart';
import '../../../models/group_model.dart';
import '../../../models/user_model.dart';
import '../../../services/box_service.dart';
import '../../../services/storage_api.dart';
import '../../auth/controller/auth_controller.dart';
import '../../expense/controller/expense_controller.dart';
import '../../group/controller/group_controller.dart';
part 'box_controller.freezed.dart';

final boxNotifierProvider = StateNotifierProvider<BoxNotifier, BoxState>(
  (ref) {
    return BoxNotifier(
      boxAPI: ref.watch(boxAPIProvider),
      storageAPI: ref.watch(storageAPIProvider),
      ref: ref,
    );
  },
);

@freezed
class BoxState with _$BoxState {
  const factory BoxState.init() = BoxInitState;
  const factory BoxState.loading() = BoxLoadingState;
  const factory BoxState.loaded() = BoxLoadedState;
  const factory BoxState.error(String message) = BoxErrorState;
}

final getBoxesProvider = FutureProvider((ref) {
  final boxesController = ref.watch(boxNotifierProvider.notifier);
  return boxesController.getBoxes();
});

final getBoxesInGroupProvider =
    FutureProvider.family.autoDispose((ref, String groupId) {
  final boxesController = ref.watch(boxNotifierProvider.notifier);
  return boxesController.getBoxesInGroup(groupId);
});

final getBoxDetailProvider =
    FutureProvider.family.autoDispose((ref, String boxId) {
  final boxesController = ref.watch(boxNotifierProvider.notifier);
  return boxesController.getBoxDetail(boxId);
});

final getUsersInBoxProvider =
    FutureProvider.family.autoDispose((ref, List<String> userIds) async {
  final boxesController = ref.watch(boxNotifierProvider.notifier);
  List<UserModel> usersInBox = await boxesController.getUsersInBox(userIds);
  ref.read(userInBoxStoreProvider.notifier).state = usersInBox;
  return usersInBox;
});

final userInBoxStoreProvider = StateProvider<List<UserModel>>((ref) {
  return [];
});

class BoxNotifier extends StateNotifier<BoxState> {
  BoxNotifier({
    required this.ref,
    required this.boxAPI,
    required this.storageAPI,
  }) : super(const BoxState.init());

  final Ref ref;
  final BoxAPI boxAPI;
  final StorageAPI storageAPI;

  Future<void> addBox({
    required ValueNotifier<File?> image,
    required TextEditingController boxTitle,
    required TextEditingController boxDescription,
    required GroupModel groupModel,
  }) async {
    state = const BoxState.loading();
    final currentUser = ref.watch(currentUserProvider);
    List<String> imageLinks = [];
    if (image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => BoxState.error(l.message),
        (r) => imageLinks = r,
      );
    }

    BoxModel boxModel = BoxModel(
      title: boxTitle.text,
      description: boxDescription.text,
      creatorId: currentUser!.$id,
      groupId: groupModel.id!,
      image: imageLinks.isNotEmpty ? imageLinks[0] : null,
      boxUsers: [currentUser.$id],
      total: 0,
    );

    final res = await boxAPI.addBox(boxModel);

    state = res.fold(
      (l) => BoxState.error(l.message),
      (r) {
        ref.read(groupNotifierProvider.notifier).updateGroup(
          groupModel: groupModel,
          boxIds: [...groupModel.boxIds, r.$id],
        );
        return const BoxState.loaded();
      },
    );
  }

  Future<void> updateBox({
    required String boxId,
    ValueNotifier<File?>? image,
    TextEditingController? boxTitle,
    TextEditingController? boxDescription,
    List<String>? expenseIds,
    num? total,
  }) async {
    state = const BoxState.loading();
    Map<String, dynamic> updateData = {};

    updateData["\$id"] = boxId;

    if (image != null && image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => BoxState.error(l.message),
        (r) => updateData['image'] = r.first,
      );
    }

    if (boxTitle != null && boxTitle.text.isNotEmpty) {
      // Add boxTitle to the update data
      updateData['title'] = boxTitle.text;
    }

    if (boxDescription != null && boxDescription.text.isNotEmpty) {
      // Add boxDescription to the update data
      updateData['description'] = boxDescription.text;
    }

    if (total != null) {
      // Add total cost to the update data | add new expense cost + total
      updateData['total'] = total;
    }

    if (expenseIds != null) {
      // Add boxDescription to the update data
      updateData['expenseIds'] = expenseIds;
    }

    final res = await boxAPI.updateBox(updateData);

    state = res.fold(
      (l) => BoxState.error(l.message),
      (r) => const BoxState.loaded(),
    );
  }

  Future<void> deleteBox(BoxModel boxModel) async {
    state = const BoxState.loading();
    //remove box from server
    final res = await boxAPI.deleteBox(boxModel.id!);
    //remove box image from storage
    if (boxModel.image != null) {
      final imageDeleteRes = await storageAPI.deleteImage(boxModel.image!);
      imageDeleteRes.fold(
        (l) => BoxState.error(l.message),
        (r) => null,
      );
    }

    state = res.fold(
      (l) => BoxState.error(l.message),
      (r) {
        ref
            .read(expenseNotifierProvider.notifier)
            .deleteAllExpense(boxModel.expenseIds);
        return const BoxState.loaded();
      },
    );
  }

  Future<void> deleteAllBox(List<String> boxIds) async {
    state = const BoxState.loading();
    //remove box from server

    final res = await boxAPI.deleteAllBox(boxIds);

    //remove box image from storage
    //if (boxModel.image != null) {
    //  final imageDeleteRes = await storageAPI.deleteImage(boxModel.image!);
    //  imageDeleteRes.fold(
    //    (l) => BoxState.error(l.message),
    //    (r) => null,
    //  );
    //}

    state = res.fold(
      (l) => BoxState.error(l.message),
      (r) {
        // Deleting expense in every box
        //ref
        //    .read(expenseNotifierProvider.notifier)
        //    .deleteAllExpense(ids: boxModel.expenseIds);
        return const BoxState.loaded();
      },
    );
  }

  Future<List<BoxModel>> getBoxes() async {
    final user = ref.watch(currentUserProvider);
    final boxList = await boxAPI.getBoxes(user!.$id);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }

  Future<List<BoxModel>> getBoxesInGroup(String groupId) async {
    final boxList = await boxAPI.getBoxesInGroup(groupId);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }

  Future<BoxModel> getBoxDetail(String boxId) async {
    final box = await boxAPI.getBoxDetail(boxId);
    return BoxModel.fromJson(box.data);
  }

  Future<List<UserModel>> getUsersInBox(List<String> userIds) async {
    final users = await boxAPI.getUsersInBox(userIds);
    return users.map((user) => UserModel.fromJson(user.data)).toList();
  }

  Future<List<BoxModel>> getCurrentUserBoxes() async {
    final user = ref.watch(currentUserProvider);
    final boxList = await boxAPI.getBoxesInGroup(user!.$id);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }
}
