import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../constants/size_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/friends/friends_widget.dart';
import '../../../widgets/text_field/custom_text_field.dart';

class CreateGroupWidget {
  /// * ----- Groupe info card
  groupInfoCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      padding: const EdgeInsets.all(15),
      width: SizeConfig.width(context),
      decoration: BoxDecoration(
        color: ColorConfig.pureWhite,
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
                child: CustomTextField(hintText: 'Group Name'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _selectOptionButton(
                onTap: () {},
                icon: 'assets/svg/category_icon.svg',
                title: 'category',
              ),
              const SizedBox(width: 10),
              _selectOptionButton(
                onTap: () {},
                icon: 'assets/svg/currency_icon.svg',
                title: 'currency',
              ),
            ],
          ),
          const SizedBox(height: 10),
          CustomTextField(
            height: 75,
            alignment: Alignment.topLeft,
            hintText: 'Description',
          ),
        ],
      ),
    );
  }

  /// * ----- select friends card
  addFriendsCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 25, 16, 0),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      width: SizeConfig.width(context),
      decoration: BoxDecoration(
        color: ColorConfig.pureWhite,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Member',
            style: FontConfig.body1(),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              // childAspectRatio: ,
            ),
            itemBuilder: (context, i) {
              return i != 5
                  ? FriendWidget(
                      backgroundColor: Colors.grey.shade400,
                    )
                  : FriendWidget.add();
            },
          ),
        ],
      ),
    );
  }

  /// * ----- submit button
  createButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
      child: ButtonWidget(
        onPressed: () {},
        title: 'create',
      ),
    );
  }

  /// * ----- select option button
  _selectOptionButton({
    required Function onTap,
    required String icon,
    required String title,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: ColorConfig.baseGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  /// * ----- add photo button
  _addPhotoButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: ColorConfig.baseGrey,
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
