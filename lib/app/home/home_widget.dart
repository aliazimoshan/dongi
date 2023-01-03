import 'package:flutter/material.dart';
import '../../constants/font_config.dart';
import '../../widgets/card/card.dart';

class HomeWidget {
  Widget expenseSummery() {
    return Padding(
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
    return Column(
      children: [
        _groupTitle(),
        _groupCardLists(),
      ],
    );
  }

  _groupTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(26, 0, 10, 10),
      child: Row(
        children: [
          Text(
            "Groups",
            style: FontConfig.h6(),
          ),
        ],
      ),
    );
  }

  _groupCardLists() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          _groupCard(),
          _groupCard(),
          _groupCard(),
          _moreCircle(),
        ],
      ),
    );
  }

  _groupCard() {
    boxCount() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Boxes",
            style: FontConfig.overline().copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "5",
            style: FontConfig.body2(),
          ),
        ],
      );
    }

    memberRow() {
      circleBox(Color color, {IconData? icon}) {
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 12,
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "members",
            style: FontConfig.overline().copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 40,
                      child: circleBox(Colors.grey.shade900),
                    ),
                    Positioned(
                      left: 30,
                      child: circleBox(Colors.grey.shade800),
                    ),
                    Positioned(
                      left: 20,
                      child: circleBox(Colors.grey.shade700),
                    ),
                    Positioned(
                      left: 10,
                      child: circleBox(Colors.grey.shade600),
                    ),
                    circleBox(Colors.grey.shade500),
                  ],
                ),
              ),
              circleBox(Colors.black, icon: Icons.share)
            ],
          )
        ],
      );
    }

    return CardWidget(
      child: AspectRatio(
        aspectRatio: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //group name widget
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "Group Name",
                  style: FontConfig.overline().copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
            //box count
            boxCount(),
            //member row
            memberRow(),
          ],
        ),
      ),
    );
  }

  _moreCircle() {
    return Container(
      width: 48,
      height: 48,
      margin: const EdgeInsets.fromLTRB(10, 0, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
    );
  }
}
