import 'dart:io';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../models/group_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/group_service.dart';
import '../../../services/storage_api.dart';
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
    final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
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
      groupUsers: [],
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
    required ValueNotifier<File?> image,
    required TextEditingController groupTitle,
    required TextEditingController groupDescription,
    required GroupModel groupModel,
  }) async {
    state = const GroupState.loading();
    //final currentUser = await ref.watch(authAPIProvider).currentUserAccount();
    List<String> imageLinks = [];
    if (image.value != null) {
      final imageUploadRes = await storageAPI.uploadImage([image.value!]);
      imageUploadRes.fold(
        (l) => state = GroupState.error(l.message),
        (r) => imageLinks = r,
      );
    }

    GroupModel newGroupModel = GroupModel(
      id: groupModel.id,
      title: groupTitle.text,
      description: groupDescription.text,
      creatorId: groupModel.creatorId,
      image: imageLinks.isNotEmpty ? imageLinks[0] : groupModel.image,
      groupUsers: [],
      boxIds: [],
      totalBalance: 0,
    );

    final res = await groupAPI.updateGroup(newGroupModel);
    state = res.fold(
      (l) => GroupState.error(l.message),
      (r) => const GroupState.loaded(),
    );
  }

  Future<void> deleteGroup({
    required BuildContext context,
    required WidgetRef ref,
    required GroupModel groupModel,
  }) async {
    state = const GroupState.loading();
    //remove group from server
    final res = await groupAPI.deleteGroup(groupModel.id!);
    //remove group image from storage
    if (groupModel.image != null) {
      await storageAPI.deleteImage(groupModel.image!);
    }

    state = res.fold(
      (l) => GroupState.error(l.message),
      (r) => const GroupState.loaded(),
    );
  }

  Future<List<GroupModel>> getGroups() async {
    final user = await ref.read(authAPIProvider).currentUserAccount();
    final groupList = await groupAPI.getGroups(user!.$id);
    return groupList.map((group) => GroupModel.fromJson(group.data)).toList();
  }

  Future<GroupModel> getGroupDetail(String groupId) async {
    final user = await ref.read(authAPIProvider).currentUserAccount();
    final group = await groupAPI.getGroupDetail(user!.$id, groupId);
    return GroupModel.fromJson(group.data);
  }
}
