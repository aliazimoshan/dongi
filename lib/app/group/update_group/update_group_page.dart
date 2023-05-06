import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../models/group_model.dart';
import '../../../widgets/appbar/appbar.dart';
import '../controller/group_controller.dart';
import 'update_group_widget.dart';

class UpdateGroupPage extends HookConsumerWidget {
  final GroupModel groupModel;
  UpdateGroupPage({super.key, required this.groupModel});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupTitle = useTextEditingController(text: groupModel.title);
    final groupDescription =
        useTextEditingController(text: groupModel.description);
    final oldGroupImage = useState<String?>(groupModel.image);
    final newGroupImage = useState<File?>(null);

    /// by using listen we are not gonna rebuild our app
    ref.listen<GroupState>(
      groupNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () {
            showSnackBar(context, "Successfully updated!!");
            context.pop();
            //ref.refresh(refreshGroupsProvider).value;
          },
          error: (message) {
            showSnackBar(context, message);
          },
        );
      },
    );

    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Update Group"),
      body: Column(
        children: [
          UpdateGroupInfoCard(
            newGroupImage: newGroupImage,
            oldGroupImage: oldGroupImage,
            groupTitle: groupTitle,
            groupDescription: groupDescription,
            formKey: _formKey,
          ),
          const UpdateGroupAddFriendCard(),
          const Spacer(),
          UpgradeGroupCreateButton(
            formKey: _formKey,
            newGroupImage: newGroupImage,
            groupTitle: groupTitle,
            groupDescription: groupDescription,
            groupModel: groupModel,
          ),
        ],
      ),
    );
  }
}
