import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/card/grey_card.dart';
import '../../../widgets/text_field/text_field.dart';

class CreateExpenseWidget {
  amountRow() {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            hintText: "hintText",
            fillColor: ColorConfig.white,
          ),
        ),
        const SizedBox(width: 10),
        const GreyCardWidget(
          width: 50,
          height: 50,
          child: Center(
            child: Text("USD"),
          ),
        ),
      ],
    );
  }

  categoryCard() {
    return Expanded(
      child: CardWidget(
        backColor: ColorConfig.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category_outlined, color: ColorConfig.primarySwatch),
            const SizedBox(width: 5),
            const Text("Category"),
          ],
        ),
      ),
    );
  }

  dateCard() {
    return Expanded(
      child: CardWidget(
        backColor: ColorConfig.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.date_range,
              color: ColorConfig.primarySwatch,
            ),
            const SizedBox(width: 5),
            const Text("20 Nov, 2020"),
          ],
        ),
      ),
    );
  }

  madeByButton() {
    return _actionButton(
      "made by",
      "Person name",
      Icons.account_box,
    );
  }

  splitBetweenButton() {
    return _actionButton(
      "split between",
      "Splitting method",
      Icons.call_split,
    );
  }

  _actionButton(String title, String subtitle, IconData icon) {
    return ListTileCard(
      backColor: ColorConfig.white,
      titleString: title,
      subtitleString: subtitle,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorConfig.pureWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  descriptionCard() {
    return CardWidget(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CardWidget(
            backColor: ColorConfig.white,
            child: SizedBox(
              width: 75,
              height: 75,
              child: Icon(
                Icons.description_outlined,
                color: ColorConfig.primarySwatch,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFieldWidget(
              hintText: "Description",
              maxLines: 3,
              fillColor: ColorConfig.white,
            ),
          ),
        ],
      ),
    );
  }

  createButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ButtonWidget(
          onPressed: () {},
          title: "Create",
          textColor: ColorConfig.secondary,
        ),
      ),
    );
  }
}
