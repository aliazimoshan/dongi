import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../constants/size_config.dart';
import '../../../core/utils.dart';
import '../../../core/validation.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/text_field/text_field.dart';
import '../controller/box_controller.dart';

class CreateBoxInfoCard extends ConsumerWidget {
  final TextEditingController boxTitle;
  final TextEditingController boxDescription;
  final ValueNotifier<File?> image;
  final GlobalKey<FormState> formKey;

  const CreateBoxInfoCard({
    super.key,
    required this.boxTitle,
    required this.boxDescription,
    required this.image,
    required this.formKey,
  });

  selectOptionButton({
    required Function onTap,
    required String icon,
    required String title,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 10),
            Text(
              title,
              style: FontConfig.body2(),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: ColorConfig.primarySwatch,
              size: 20,
            )
          ],
        ),
      ),
    );
  }

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
                  child: TextFieldWidget(
                    hintText: 'Box Name',
                    fillColor: ColorConfig.white,
                    controller: boxTitle,
                    validator:
                        ref.read(formValidatorProvider.notifier).validateTitle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            selectOptionButton(
              onTap: () {},
              icon: 'assets/svg/currency_icon.svg',
              title: 'currency',
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              maxLines: 2,
              hintText: 'Description',
              fillColor: ColorConfig.white,
              controller: boxDescription,
            ),
          ],
        ),
      ),
    );
  }
}

class CreateBoxSelectFriends extends ConsumerWidget {
  const CreateBoxSelectFriends({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'select member',
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
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    // childAspectRatio: ,
                  ),
                  itemBuilder: (context, i) => FriendWidget(
                    backgroundColor: ColorConfig.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateBoxButton extends ConsumerWidget {
  final ValueNotifier<File?> image;
  final TextEditingController boxTitle;
  final TextEditingController boxDescription;
  final GlobalKey<FormState> formKey;
  final String groupId;

  const CreateBoxButton({
    super.key,
    required this.image,
    required this.boxTitle,
    required this.boxDescription,
    required this.formKey,
    required this.groupId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: ButtonWidget(
        isLoading: ref.watch(boxNotifierProvider).maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ref.read(boxNotifierProvider.notifier).addBox(
                  image: image,
                  boxTitle: boxTitle,
                  boxDescription: boxDescription,
                  groupId: groupId,
                );
          }
        },
        title: 'create',
        textColor: ColorConfig.secondary,
      ),
    );
  }
}
