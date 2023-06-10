import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/box_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/box_service.dart';
import '../../../services/storage_api.dart';
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

//final refreshBoxesProvider =
//    FutureProvider.family.autoDispose((ref, String groupId) {
//  final boxesController = ref.refresh(boxNotifierProvider.notifier);
//  return boxesController.getBoxesInGroup(groupId);
//});

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
    required String groupId,
  }) async {
    state = const BoxState.loading();
    final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
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
      groupId: groupId,
      image: imageLinks.isNotEmpty ? imageLinks[0] : null,
      boxUser: [],
      total: 0,
    );

    final res = await boxAPI.addBox(boxModel);

    state = res.fold(
      (l) => BoxState.error(l.message),
      (r) => const BoxState.loaded(),
    );
  }

  Future<void> updateBox({
    required ValueNotifier<File?> image,
    required TextEditingController boxTitle,
    required TextEditingController boxDescription,
    required BoxModel boxModel,
  }) async {
    state = const BoxState.loading();
    //final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
    List<String> imageLinks = [];
    if (image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => BoxState.error(l.message),
        (r) => imageLinks = r,
      );
    }
    BoxModel newBoxModel = BoxModel(
      id: boxModel.id,
      title: boxTitle.text,
      description: boxDescription.text,
      creatorId: boxModel.creatorId,
      groupId: boxModel.groupId,
      image: imageLinks.isNotEmpty ? imageLinks[0] : boxModel.image,
    );

    final res = await boxAPI.updateBox(newBoxModel);

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
      (r) => const BoxState.loaded(),
    );
  }

  Future<List<BoxModel>> getBoxes() async {
    final user = await ref.watch(authAPIProvider).currentUserAccount();
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

  Future<List<BoxModel>> getCurrentUserBoxes() async {
    final user = await ref.watch(authAPIProvider).currentUserAccount();
    final boxList = await boxAPI.getBoxesInGroup(user!.$id);
    return boxList.map((box) => BoxModel.fromJson(box.data)).toList();
  }
}
