import 'package:flutter/material.dart';
import '../../constants/font_config.dart';
import '../../widgets/card/card.dart';

class HomeWidget {
  Widget expenseSummery() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
              style: FontConfig.body1(),
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
                  style: FontConfig.body1(),
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
                  style: FontConfig.body1(),
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

  recentGroup() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          _groupTitle(),
          _groupCardLists(),
        ],
      ),
    );
  }

  _groupTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 10, 10),
      child: Row(
        children: [
          Text(
            "Group",
            style: FontConfig.h6(),
          ),
        ],
      ),
    );
  }

  _groupCardLists() {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _groupCard(),
          _groupCard(),
          _groupCard(),
        ],
      ),
    );
  }

  _groupCard() {
    return CardWidget(
        child: AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 32,
                height: 32,
              ),
              Text("Group Name")
            ],
          )
        ],
      ),
    ));
  }
}
