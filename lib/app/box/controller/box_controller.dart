import 'dart:io';
import 'package:dongi/core/utils.dart';
import 'package:dongi/models/box_model.dart';
import 'package:dongi/services/auth_service.dart';
import 'package:dongi/services/box_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/storage_api.dart';

final boxControllerProvider = StateNotifierProvider<BoxNotifier, bool>(
  (ref) {
    return BoxNotifier(
      boxAPI: ref.watch(boxAPIProvider),
      storageAPI: ref.watch(storageAPIProvider),
      ref: ref,
    );
  },
);

final getBoxesProvider = FutureProvider((ref) {
  final boxesController = ref.watch(boxControllerProvider.notifier);
  return boxesController.getBoxes();
});

final getBoxesInGroupProvider =
    FutureProvider.family.autoDispose((ref, String groupId) {
  final boxesController = ref.watch(boxControllerProvider.notifier);
  return boxesController.getBoxesInGroup(groupId);
});

final refreshBoxesProvider = FutureProvider((ref) {
  final boxesController = ref.refresh(boxControllerProvider.notifier);
  return boxesController.getBoxes();
});

class BoxNotifier extends StateNotifier<bool> {
  final Ref _ref;
  final BoxAPI _boxAPI;
  final StorageAPI _storageAPI;

  BoxNotifier({
    required Ref ref,
    required BoxAPI boxAPI,
    required StorageAPI storageAPI,
  })  : _ref = ref,
        _boxAPI = boxAPI,
        _storageAPI = storageAPI,
        super(false);

  Future<void> addBox({
    required BuildContext context,
    required WidgetRef ref,
    required ValueNotifier<File?> image,
    required TextEditingController boxTitle,
    required TextEditingController boxDescription,
    required String groupId,
  }) async {
    state = true;
    final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
    List<String> imageLinks = [];
    if (image.value != null) {
      imageLinks = await _storageAPI.uploadImage([image.value!]);
    }

    BoxModel boxModel = BoxModel(
      title: boxTitle.text,
      description: boxDescription.text,
      creatorId: currentUser!.$id,
      groupId: groupId,
      image: imageLinks.isNotEmpty ? imageLinks[0] : null,
    );

    final res = await _boxAPI.addBox(boxModel);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        context.pop();
        ref.refresh(refreshBoxesProvider).value;
      },
    );
  }

  Future<void> updateBox({
    required BuildContext context,
    required WidgetRef ref,
    required ValueNotifier<File?> image,
    required TextEditingController boxTitle,
    required TextEditingController boxDescription,
    required BoxModel boxModel,
  }) async {
    state = true;
    //final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
    List<String> imageLinks = [];
    if (image.value != null) {
      imageLinks = await _storageAPI.uploadImage([image.value!]);
    }
    BoxModel newBoxModel = BoxModel(
      id: boxModel.id,
      title: boxTitle.text,
      description: boxDescription.text,
      creatorId: boxModel.creatorId,
      groupId: boxModel.groupId,
      image: imageLinks.isNotEmpty ? imageLinks[0] : boxModel.image,
    );

    final res = await _boxAPI.updateBox(newBoxModel);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        context.pop();
        ref.refresh(refreshBoxesProvider).value;
      },
    );
  }

  Future<void> deleteBox({
    required BuildContext context,
    required WidgetRef ref,
    required BoxModel boxModel,
  }) async {
    state = true;
    //remove box from server
    final res = await _boxAPI.deleteBox(boxModel.id!);
    //remove box image from storage
    if (boxModel.image != null) {
      await _storageAPI.deleteImage(boxModel.image!);
    }
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, "Successfully deleted");
        //update list of box when back
        //.value is for prevent dart warning (it will work without .value)
        ref.refresh(refreshBoxesProvider).value;
      },
    );
  }

  Future<List<BoxModel>> getBoxes() async {
    final user = await _ref.watch(authAPIProvider).currentUserAccount();
    final boxList = await _boxAPI.getBoxes(user!.$id);
    return boxList.map((box) {
      //remove members from response
      //because appwrite not support relational database
      //and we also cant remove fields from response
      box.data["members"] = [];
      return BoxModel.fromMap(box.data);
    }).toList();
  }

  Future<List<BoxModel>> getBoxesInGroup(String groupId) async {
    final boxList = await _boxAPI.getBoxesInGroup(groupId);
    return boxList.map((box) => BoxModel.fromMap(box.data)).toList();
  }

  Future<List<BoxModel>> getCurrentUserBoxes() async {
    final user = await _ref.watch(authAPIProvider).currentUserAccount();
    final boxList = await _boxAPI.getBoxesInGroup(user!.$id);
    return boxList.map((box) => BoxModel.fromMap(box.data)).toList();
  }
}
