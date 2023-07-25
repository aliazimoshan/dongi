import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/group_model.dart';
import '../../../models/user_model.dart';
import '../../../services/group_service.dart';
import '../../../services/storage_api.dart';
import '../../auth/controller/auth_controller.dart';
import '../../box/controller/box_controller.dart';
part 'group_controller.freezed.dart';

final groupNotifierProvider = StateNotifierProvider<GroupNotifier, GroupState>(
  (ref) {
    return GroupNotifier(
      ref: ref,
      groupAPI: ref.watch(groupAPIProvider),
      storageAPI: ref.watch(storageAPIProvider),
    );
  },
);

@freezed
class GroupState with _$GroupState {
  const factory GroupState.init() = GroupInitState;
  const factory GroupState.loading() = GroupLoadingState;
  const factory GroupState.loaded() = GroupLoadedState;
  const factory GroupState.error(String message) = GroupErrorState;
}

final getGroupsProvider = FutureProvider((ref) {
  final groupsController = ref.watch(groupNotifierProvider.notifier);
  return groupsController.getGroups();
});

final getUsersInGroupProvider =
    FutureProvider.family.autoDispose((ref, List<String> userIds) {
  final groupController = ref.watch(groupNotifierProvider.notifier);
  return groupController.getUsersInGroup(userIds);
});

final getGroupDetailProvider =
    FutureProvider.family.autoDispose((ref, String groupId) {
  final groupsController = ref.watch(groupNotifierProvider.notifier);
  return groupsController.getGroupDetail(groupId);
});

class GroupNotifier extends StateNotifier<GroupState> {
  GroupNotifier({
    required this.ref,
    required this.groupAPI,
    required this.storageAPI,
  }) : super(const GroupState.init());

  final Ref ref;
  final GroupAPI groupAPI;
  final StorageAPI storageAPI;

  Future<void> addGroup({
    required ValueNotifier<File?> image,
    required TextEditingController groupTitle,
    required TextEditingController groupDescription,
  }) async {
    state = const GroupState.loading();
    final currentUser = ref.read(currentUserProvider);
    List<String> imageLinks = [];
    if (image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => GroupState.error(l.message),
        (r) => imageLinks = r,
      );
    }

    GroupModel groupModel = GroupModel(
      title: groupTitle.text,
      description: groupDescription.text,
      creatorId: currentUser!.$id,
      image: imageLinks.isNotEmpty ? imageLinks[0] : null,
      groupUsers: [currentUser.$id],
      boxIds: [],
      totalBalance: 0,
    );

    final res = await groupAPI.addGroup(groupModel);
    state = res.fold(
      (l) => GroupState.error(l.message),
      (r) => const GroupState.loaded(),
    );
  }

  Future<void> updateGroup({
    required GroupModel groupModel,
    ValueNotifier<File?>? image,
    TextEditingController? groupTitle,
    TextEditingController? groupDescription,
    List<String>? boxIds,
  }) async {
    state = const GroupState.loading();
    final Map<String, dynamic> updateData = {};

    updateData['\$id'] = groupModel.id!;

    if (image != null && image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => state = GroupState.error(l.message),
        (r) => updateData["image"] = r.first,
      );
    }

    if (groupTitle != null && groupTitle.text.isNotEmpty == true) {
      // Add groupTitle to the update data
      updateData['title'] = groupTitle.text;
    }
    if (groupDescription != null && groupDescription.text.isNotEmpty == true) {
      // Add groupDescription to the update data
      updateData['description'] = groupDescription.text;
    }

    if (boxIds != null) {
      updateData['boxIds'] = boxIds;
    }

    //GroupModel newGroupModel = GroupModel(
    //  id: groupModel.id,
    //  title: groupTitle.text,
    //  description: groupDescription.text,
    //  creatorId: groupModel.creatorId,
    //  image: imageLinks.isNotEmpty ? imageLinks[0] : groupModel.image,
    //  groupUsers: groupModel.groupUsers,
    //  boxIds: groupModel.boxIds,
    //  totalBalance: groupModel.totalBalance,
    //);

    final res = await groupAPI.updateGroup(updateData);
    state = res.fold(
      (l) => GroupState.error(l.message),
      (r) => const GroupState.loaded(),
    );
  }

  Future<void> deleteGroup(GroupModel groupModel) async {
    state = const GroupState.loading();
    //remove group from server
    final res = await groupAPI.deleteGroup(groupModel.id!);
    //remove group image from storage
    if (groupModel.image != null) {
      await storageAPI.deleteImage(groupModel.image!);
    }

    state = res.fold(
      (l) => GroupState.error(l.message),
      (r) {
        ref.read(boxNotifierProvider.notifier).deleteAllBox(groupModel.boxIds);
        return const GroupState.loaded();
      },
    );
  }

  Future<List<GroupModel>> getGroups() async {
    final user = ref.read(currentUserProvider);
    final groupList = await groupAPI.getGroups(user!.$id);
    return groupList.map((group) => GroupModel.fromJson(group.data)).toList();
  }

  Future<List<UserModel>> getUsersInGroup(List<String> userIds) async {
    final users = await groupAPI.getUsersInGroup(userIds);
    return users.map((user) => UserModel.fromJson(user.data)).toList();
  }

  Future<GroupModel> getGroupDetail(String groupId) async {
    final user = ref.read(currentUserProvider);
    final group = await groupAPI.getGroupDetail(user!.$id, groupId);
    return GroupModel.fromJson(group.data);
  }
}
