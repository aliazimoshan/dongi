import 'dart:io';

import 'package:dongi/core/utils.dart';
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

class CreateGroupInfoCard extends ConsumerWidget {
  final TextEditingController groupTitle;
  final TextEditingController groupDescription;
  final ValueNotifier<File?> image;
  final GlobalKey<FormState> formKey;
  const CreateGroupInfoCard({
    super.key,
    required this.groupTitle,
    required this.groupDescription,
    required this.image,
    required this.formKey,
  });

  /// * ----- add photo button
  _addPhotoButton(ValueNotifier<File?> image) {
    return InkWell(
      onTap: () async {
        image.value = await pickImage();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: BorderRadius.circular(10),
          image: image.value != null
              ? DecorationImage(
                  image: FileImage(image.value!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: image.value == null
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
                _addPhotoButton(image),
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
            //Row(
            //  children: [
            //    _selectOptionButton(
            //      onTap: () {},
            //      icon: 'assets/svg/category_icon.svg',
            //      title: 'category',
            //    ),
            //    const SizedBox(width: 10),
            //    _selectOptionButton(
            //      onTap: () {},
            //      icon: 'assets/svg/currency_icon.svg',
            //      title: 'currency',
            //    ),
            //  ],
            //),
            //const SizedBox(height: 10),
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

class CreateGroupButton extends ConsumerWidget {
  final ValueNotifier<File?> image;
  final TextEditingController groupTitle;
  final TextEditingController groupDescription;
  final GlobalKey<FormState> formKey;
  const CreateGroupButton({
    required this.image,
    required this.groupTitle,
    required this.groupDescription,
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
            ref.read(groupNotifierProvider.notifier).addGroup(
                  image: image,
                  groupTitle: groupTitle,
                  groupDescription: groupDescription,
                );
          }
        },
        title: 'create',
        textColor: ColorConfig.secondary,
      ),
    );
  }
}

class CreateGroupAddFriend extends ConsumerWidget {
  const CreateGroupAddFriend({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
