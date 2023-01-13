import 'package:flutter/material.dart';
import '../../../constants/color_config.dart';
import '../../../constants/font_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/card/grey_card.dart';
import '../../../widgets/text_field/text_field.dart';

class CreateExpenseWidget {
  amountRow() {
    return Row(
      children: const [
        Expanded(child: TextFieldWidget(hintText: "hintText")),
        SizedBox(width: 10),
        GreyCardWidget(
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
      child: GreyCardWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category_outlined, color: Colors.grey.shade700),
            const SizedBox(width: 3),
            const Text("Category"),
          ],
        ),
      ),
    );
  }

  dateCard() {
    return Expanded(
      child: GreyCardWidget(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.date_range,
              color: Colors.grey.shade700,
            ),
            const SizedBox(width: 3),
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
    return GreyCardWidget(
      child: ListTile(
        title: Text(title, style: FontConfig.caption()),
        subtitle: Text(
          subtitle,
          style: FontConfig.body2().copyWith(fontWeight: FontWeight.w600),
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorConfig.pureWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  descriptionCard() {
    return CardWidget(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          GreyCardWidget(
            width: 75,
            height: 75,
            child: Icon(
              Icons.description_outlined,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
              child: TextFieldWidget(
            hintText: "Description",
            // height: 75,
            maxLines: 3,
          )),
        ],
      ),
    );
  }

  createButton() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ButtonWidget(onPressed: () {}, title: "Create"),
      ),
    );
  }
}
