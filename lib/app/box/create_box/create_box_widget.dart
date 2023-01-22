import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../constants/size_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/friends/friend.dart';
import '../../../widgets/text_field/text_field.dart';

class CreateBoxWidget {
  /// * ----- box info card
  boxInfoCard(BuildContext context) {
    /// * ----- select option button
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

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 0),
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
              _addPhotoButton(),
              const SizedBox(width: 10),
              Expanded(
                child: TextFieldWidget(
                  hintText: 'Box Name',
                  fillColor: ColorConfig.white,
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
          ),
        ],
      ),
    );
  }

  /// * ----- select friends card
  selectFriendsCard(BuildContext context) => Padding(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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

  /// * ----- submit button
  createButton() => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
        child: ButtonWidget(
          onPressed: () {},
          title: 'create',
          textColor: ColorConfig.secondary,
        ),
      );

  /// * ----- add photo button
  _addPhotoButton() {
    return InkWell(
      onTap: () {},
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
