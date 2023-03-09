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
    );

    final res = await _groupAPI.addGroup(groupModel);
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => context.pop(),
    );
  }

  Future<List<GroupModel>> getGroups() async {
    final user = await _ref.watch(authAPIProvider).currentUserAccount();
    final groupList = await _groupAPI.getGroups(user!.$id);
    return groupList.map((group) => GroupModel.fromMap(group.data)).toList();
  }
}
