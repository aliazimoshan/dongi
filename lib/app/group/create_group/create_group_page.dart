import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../../../widgets/appbar/appbar.dart';
import '../controller/group_controller.dart';
import 'create_group_widget.dart';

class CreateGroupPage extends HookConsumerWidget {
  CreateGroupPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupTitle = useTextEditingController();
    final groupDescription = useTextEditingController();
    final image = useState<File?>(null);

    /// by using listen we are not gonna rebuild our app
    ref.listen<GroupState>(
      groupNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () {
            showSnackBar(context, "Successfully Created!!");
            context.pop();
          },
          error: (message) {
            showSnackBar(context, message);
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBarWidget(title: "Create Group"),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CreateGroupInfoCard(
                  image: image,
                  groupTitle: groupTitle,
                  groupDescription: groupDescription,
                  formKey: _formKey,
                ),
                const CreateGroupAddFriend(),
              ],
            ),
          ),
          CreateGroupButton(
            formKey: _formKey,
            image: image,
            groupTitle: groupTitle,
            groupDescription: groupDescription,
          ),
        ],
      ),
    );
  }
}
