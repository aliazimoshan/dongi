import 'dart:convert';
import 'dart:io';

import 'package:dongi/core/utils.dart';
import 'package:dongi/models/group_model.dart';
import 'package:dongi/services/auth_service.dart';
import 'package:dongi/services/group_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/storage_api.dart';

final groupControllerProvider = StateNotifierProvider<GroupNotifier, bool>(
  (ref) {
    return GroupNotifier(
      groupAPI: ref.watch(groupAPIProvider),
      storageAPI: ref.watch(storageAPIProvider),
      ref: ref,
    );
  },
);

final getGroupsProvider = FutureProvider((ref) {
  final groupsController = ref.watch(groupControllerProvider.notifier);
  return groupsController.getGroups();
});

final getGroupDetailProvider =
    FutureProvider.family.autoDispose((ref, String groupId) {
  final groupsController = ref.watch(groupControllerProvider.notifier);
  return groupsController.getGroupDetail(groupId);
});

final refreshGroupsProvider = FutureProvider((ref) {
  final groupsController = ref.refresh(groupControllerProvider.notifier);
  return groupsController.getGroups();
});

class GroupNotifier extends StateNotifier<bool> {
  final Ref _ref;
  final GroupAPI _groupAPI;
  final StorageAPI _storageAPI;

  GroupNotifier({
    required Ref ref,
    required GroupAPI groupAPI,
    required StorageAPI storageAPI,
  })  : _ref = ref,
        _groupAPI = groupAPI,
        _storageAPI = storageAPI,
        super(false);

  Future<void> addGroup({
    required BuildContext context,
    required WidgetRef ref,
    required ValueNotifier<File?> image,
    required TextEditingController groupTitle,
    required TextEditingController groupDescription,
  }) async {
    state = true;
    final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
    List<String> imageLinks = [];
    if (image.value != null) {
      imageLinks = await _storageAPI.uploadImage([image.value!]);
    }

    GroupModel groupModel = GroupModel(
      title: groupTitle.text,
      description: groupDescription.text,
      creatorId: currentUser!.$id,
      image: imageLinks.isNotEmpty ? imageLinks[0] : null,
      members: [],
      boxes: [],
      totalBalance: 0,
    );

    final res = await _groupAPI.addGroup(groupModel);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        context.pop();
        ref.refresh(refreshGroupsProvider).value;
      },
    );
  }

  Future<void> updateGroup({
    required BuildContext context,
    required WidgetRef ref,
    required ValueNotifier<File?> image,
    required TextEditingController groupTitle,
    required TextEditingController groupDescription,
    required GroupModel groupModel,
  }) async {
    state = true;
    //final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
    List<String> imageLinks = [];
    if (image.value != null) {
      imageLinks = await _storageAPI.uploadImage([image.value!]);
    }

    GroupModel newGroupModel = GroupModel(
      id: groupModel.id,
      title: groupTitle.text,
      description: groupDescription.text,
      creatorId: groupModel.creatorId,
      image: imageLinks.isNotEmpty ? imageLinks[0] : groupModel.image,
      members: [],
      boxes: [],
      totalBalance: 0,
    );

    final res = await _groupAPI.updateGroup(newGroupModel);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        context.pop();
        ref.refresh(refreshGroupsProvider).value;
      },
    );
  }

  Future<void> deleteGroup({
    required BuildContext context,
    required WidgetRef ref,
    required GroupModel groupModel,
  }) async {
    state = true;
    //remove group from server
    final res = await _groupAPI.deleteGroup(groupModel.id!);
    //remove group image from storage
    if (groupModel.image != null) {
      await _storageAPI.deleteImage(groupModel.image!);
    }
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) {
        showSnackBar(context, "Successfully deleted");
        //update list of group when back
        //.value is for prevent dart warning (it will work without .value)
        ref.refresh(refreshGroupsProvider).value;
      },
    );
  }

  Future<List<GroupModel>> getGroups() async {
    final user = await _ref.watch(authAPIProvider).currentUserAccount();
    final groupList = await _groupAPI.getGroups(user!.$id);
    return groupList.map((group) {
      //remove members from response
      //because appwrite not support relational database
      //and we also cant remove fields from response
      group.data["members"] = [];
      return GroupModel.fromMap(group.data);
    }).toList();
  }

  Future<GroupModel> getGroupDetail(String groupId) async {
    final user = await _ref.watch(authAPIProvider).currentUserAccount();
    final group = await _groupAPI.getGroupDetail(user!.$id, groupId);
    final groupDecode = json.decode(group.response)["data"];
    return GroupModel.fromMap(groupDecode as Map<String, dynamic>);
  }
}
