import 'dart:io';

import 'package:dongi/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../constants/size_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/text_field/text_field.dart';
import '../controller/group_controller.dart';

class CreateGroupWidget {
  /// * ----- Groupe info card
  groupInfoCard({
    required BuildContext context,
    required TextEditingController groupTitle,
    required TextEditingController groupDescription,
    required ValueNotifier<File?> image,
  }) {
    return Container(
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
    );
  }

  /// * ----- select friends card
  addFriendsCard(BuildContext context) {
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

  /// * ----- submit button
  createButton({
    required WidgetRef ref,
    required BuildContext context,
    required ValueNotifier<File?> image,
    required TextEditingController groupTitle,
    required TextEditingController groupDescription,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: ButtonWidget(
        isLoading: ref.watch(groupControllerProvider),
        onPressed: () => ref.refresh(groupControllerProvider.notifier).addGroup(
              ref: ref,
              image: image,
              groupTitle: groupTitle,
              groupDescription: groupDescription,
            ),
        title: 'create',
        textColor: ColorConfig.secondary,
      ),
    );
  }

  /// * ----- select option button
  //_selectOptionButton({
  //  required Function onTap,
  //  required String icon,
  //  required String title,
  //}) {
  //  return Expanded(
  //    child: InkWell(
  //      onTap: () {
  //        onTap();
  //      },
  //      child: Container(
  //        height: 50,
  //        decoration: BoxDecoration(
  //          color: ColorConfig.white,
  //          borderRadius: BorderRadius.circular(10),
  //        ),
  //        child: Row(
  //          mainAxisAlignment: MainAxisAlignment.center,
  //          children: [
  //            SvgPicture.asset(icon),
  //            const SizedBox(width: 10),
  //            Text(title),
  //          ],
  //        ),
  //      ),
  //    ),
  //  );
  //}

  /// * ----- add photo button
  _addPhotoButton(ValueNotifier<File?> image) {
    return InkWell(
      onTap: () async {
        print('Mamaaad');
        image.value = await pickImage();
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/add_photo_icon.svg',
            height: 14,
          ),
        ),
      ),
    );
  }
}
