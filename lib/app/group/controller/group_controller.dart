import 'package:dongi/models/group_model.dart';
import 'package:dongi/services/auth_service.dart';
import 'package:dongi/services/group_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final groupControllerProvider =
    StateNotifierProvider<GroupNotifier, bool>((ref) {
  return GroupNotifier(
    ref: ref,
    groupAPI: ref.watch(groupAPIProvider),
  );
});

class GroupNotifier extends StateNotifier<bool> {
  final Ref _ref;
  final GroupAPI _groupAPI;
  GroupNotifier({required Ref ref, required GroupAPI groupAPI})
      : _ref = ref,
        _groupAPI = groupAPI,
        super(false);

  void addGroup({
    required BuildContext context,
    required GroupModel groupModel,
  }) async {
    state = true;
    final res = await _groupAPI.addGroup(groupModel);
    state = false;
    res.fold(
      // ************************Todo
      (l) => print(l.message),
      (r) => null,
    );
  }

  // ************************Todo
  void getGroupList({
    required BuildContext context,
    required GroupModel groupModel,
  }) async {
    state = true;
    final user = await _ref.watch(authAPIProvider).currentUserAccount();
    final res = await _groupAPI.getGroupList(user!.$id);
    state = false;
    res.fold(
      (l) => print(l.message),
      (r) => null,
    );
  }
}
