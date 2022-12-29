import 'package:flutter/material.dart';
import '../../constants/font_config.dart';
import '../../widgets/card/card.dart';

class HomeWidget {
  Widget expenseSummery() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        children: [
          Expanded(child: _totalExpenseCard()),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  _incomeCard(),
                  _outcomeCard(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _totalExpenseCard() {
    return AspectRatio(
      aspectRatio: 1,
      child: CardWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Expense",
              style: FontConfig.overline(),
            ),
            Text(
              "\$140.00",
              style: FontConfig.overline(),
            ),
          ],
        ),
      ),
    );
  }

  _incomeCard() {
    return Expanded(
      child: CardWidget(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Income",
                  style: FontConfig.overline(),
                ),
                Text(
                  "\$140.00",
                  style: FontConfig.overline(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _outcomeCard() {
    return Expanded(
      child: CardWidget(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Outcome",
                  style: FontConfig.overline(),
                ),
                Text(
                  "\$140.00",
                  style: FontConfig.overline(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
