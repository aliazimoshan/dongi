import 'dart:io';

import 'package:dongi/core/utils.dart';
import 'package:dongi/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../constants/size_config.dart';
import '../../../core/validation.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/text_field/text_field.dart';
import '../controller/group_controller.dart';

class UpdateGroupInfoCard extends ConsumerWidget {
  final TextEditingController groupTitle;
  final TextEditingController groupDescription;
  final ValueNotifier<File?> newGroupImage;
  final ValueNotifier<String?> oldGroupImage;
  final GlobalKey<FormState> formKey;

  const UpdateGroupInfoCard({
    required this.groupTitle,
    required this.groupDescription,
    required this.newGroupImage,
    required this.oldGroupImage,
    required this.formKey,
    super.key,
  });

  _addPhotoButton({
    required ValueNotifier<File?> newGroupImage,
    required ValueNotifier<String?> oldGroupImage,
  }) {
    return InkWell(
      onTap: () async {
        newGroupImage.value = await pickImage();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: BorderRadius.circular(10),
          image: newGroupImage.value != null
              //This will show selected image from file
              ? DecorationImage(image: FileImage(newGroupImage.value!))
              : oldGroupImage.value != null
                  //this will show the image which uploaded before
                  ? DecorationImage(image: NetworkImage(oldGroupImage.value!))
                  : null,
        ),
        child: newGroupImage.value == null && oldGroupImage.value == null
            ? Center(
                child: SvgPicture.asset(
                  'assets/svg/add_photo_icon.svg',
                  height: 14,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        padding: const EdgeInsets.all(15),
        width: SizeConfig.width(context),
        decoration: BoxDecoration(
          color: ColorConfig.grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _addPhotoButton(
                  newGroupImage: newGroupImage,
                  oldGroupImage: oldGroupImage,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextFieldWidget(
                      hintText: 'Group Title',
                      fillColor: ColorConfig.white,
                      controller: groupTitle,
                      validator: ref
                          .read(formValidatorProvider.notifier)
                          .validateTitle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              hintText: 'Description',
              fillColor: ColorConfig.white,
              controller: groupDescription,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class UpdateGroupAddFriendCard extends StatelessWidget {
  const UpdateGroupAddFriendCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Member',
            style: FontConfig.body1(),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            width: SizeConfig.width(context),
            decoration: BoxDecoration(
              color: ColorConfig.grey,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, i) {
                    return i != 5
                        ? FriendWidget(
                            backgroundColor: ColorConfig.white,
                          )
                        : FriendWidget.add();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpgradeGroupCreateButton extends ConsumerWidget {
  final ValueNotifier<File?> newGroupImage;
  final TextEditingController groupTitle;
  final TextEditingController groupDescription;
  final GlobalKey<FormState> formKey;
  final GroupModel groupModel;

  const UpgradeGroupCreateButton({
    required this.newGroupImage,
    required this.groupTitle,
    required this.groupDescription,
    required this.groupModel,
    required this.formKey,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: ButtonWidget(
        isLoading: ref.watch(groupNotifierProvider).maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ref.read(groupNotifierProvider.notifier).updateGroup(
                  image: newGroupImage,
                  groupTitle: groupTitle,
                  groupDescription: groupDescription,
                  groupModel: groupModel,
                );
          }
        },
        title: 'update',
        textColor: ColorConfig.secondary,
      ),
    );
  }
}
