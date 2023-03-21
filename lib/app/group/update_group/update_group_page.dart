import 'dart:io';

import 'package:dongi/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import 'update_group_widget.dart';

class UpdateGroupPage extends HookConsumerWidget with UpdateGroupWidget {
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

    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(title: "Update Group"),
      body: Column(
        children: [
          groupInfoCard(
            context: context,
            newGroupImage: newGroupImage,
            oldGroupImage: oldGroupImage,
            groupTitle: groupTitle,
            groupDescription: groupDescription,
            formKey: _formKey,
            ref: ref,
          ),
          addFriendsCard(context),
          const Spacer(),
          createButton(
            ref: ref,
            context: context,
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
