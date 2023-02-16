import 'package:dongi/constants/color_config.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import '../../constants/font_config.dart';
import '../../constants/size_config.dart';
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
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Expense",
              style: FontConfig.overline().copyWith(
                color: ColorConfig.primarySwatch50,
              ),
            ),
            Text(
              "\$140.00",
              style: FontConfig.body1().copyWith(
                color: ColorConfig.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _incomeCard() {
    return Expanded(
      child: CardWidget(
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Income",
                  style: FontConfig.overline().copyWith(
                    color: ColorConfig.primarySwatch50,
                  ),
                ),
                Text(
                  "\$140.00",
                  style: FontConfig.body1().copyWith(
                    color: ColorConfig.secondary,
                  ),
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
        margin: const EdgeInsets.only(top: 5),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Outcome",
                  style: FontConfig.overline().copyWith(
                    color: ColorConfig.primarySwatch50,
                  ),
                ),
                Text(
                  "\$140.00",
                  style: FontConfig.body1().copyWith(
                    color: ColorConfig.secondary,
                  ),
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
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
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
      height: 172,
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
              color: ColorConfig.midnight.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 5),
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
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: ColorConfig.primarySwatch,
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
              color: ColorConfig.midnight.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 100,
                      child: circleBox(Colors.grey.shade900),
                    ),
                    Positioned(
                      left: 80,
                      child: circleBox(Colors.grey.shade800),
                    ),
                    Positioned(
                      left: 60,
                      child: circleBox(Colors.grey.shade700),
                    ),
                    Positioned(
                      left: 40,
                      child: circleBox(Colors.grey.shade400),
                    ),
                    Positioned(
                      left: 20,
                      child: circleBox(Colors.grey.shade600),
                    ),
                    circleBox(Colors.grey.shade500),
                  ],
                ),
              ),
              circleBox(ColorConfig.white, icon: Icons.share)
            ],
          )
        ],
      );
    }

    return CardWidget(
      margin: const EdgeInsets.only(right: 10),
      child: SizedBox(
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///* group name widget
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorConfig.primarySwatch,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "Group Name",
                  style: FontConfig.body2(),
                )
              ],
            ),
            const SizedBox(height: 15),
            //box count
            boxCount(),
            const SizedBox(height: 15),
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
      decoration: BoxDecoration(
        color: ColorConfig.primarySwatch,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.arrow_forward_rounded,
        color: ColorConfig.secondary,
      ),
    );
  }

  weeklyAnalytic(context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData(x: "SAT", y: 5),
      ChartData(x: "SUN", y: 2),
      ChartData(x: "MON", y: 8),
      ChartData(x: "TUE", y: 4),
      ChartData(x: "WEN", y: 7),
      ChartData(x: "THU", y: 5),
      ChartData(x: "FRI", y: 10),
    ];

    chartWidget() {
      return SfCartesianChart(
        margin: const EdgeInsets.only(left: 32),
        plotAreaBorderWidth: 0,
        primaryYAxis: CategoryAxis(
          //isVisible: false,
          //labelStyle: const TextStyle(color: Colors.white),
          axisLine: const AxisLine(width: 0),
          //labelPosition: ChartDataLabelPosition.inside,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 1, dashArray: [10]),
          opposedPosition: true,
          maximum: 10,
          interval: 5,
          edgeLabelPlacement: EdgeLabelPlacement.hide,
          axisLabelFormatter: (axisLabelRenderArgs) => ChartAxisLabel(
            "\$${axisLabelRenderArgs.text}00",
            FontConfig.overline(),
          ),
          //isVisible: false,
        ),
        primaryXAxis: CategoryAxis(
          //labelStyle: const TextStyle(color: Colors.white),
          axisLine: const AxisLine(width: 0),
          //labelPosition: ChartDataLabelPosition.inside,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: const MajorGridLines(width: 0),
        ),
        series: <ChartSeries<ChartData, String>>[
          ColumnSeries<ChartData, String>(
            animationDuration: 1000,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'Unit Sold',
            borderRadius: BorderRadius.circular(50),
            spacing: 0.5,
            color: ColorConfig.primarySwatch25,
          ),
        ],
        tooltipBehavior: TooltipBehavior(
          enable: true,
          canShowMarker: false,
          format: 'point.x',
          header: '',
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Analytics",
            style: FontConfig.h6(),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: SizeConfig.width(context) / 2.5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: CardWidget(
              child: chartWidget(),
            ),
          ),
        ),
      ],
    );
  }

  recentTransaction(context) {
    return Column(
      children: [
        _recentTransactionsTitle(),
        _recentTransactionsCardList(context),
      ],
    );
  }

  _recentTransactionsTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 10, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Recent Transactions",
            style: FontConfig.h6(),
          ),
          const Spacer(),
          Text(
            "Show more",
            style: FontConfig.overline().copyWith(
              color: ColorConfig.midnight.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  _recentTransactionsCardList(context) {
    return SizedBox(
      height: 85,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16),
          _recentTransactionsCard(context),
          _recentTransactionsCard(context),
          _recentTransactionsCard(context),
          _recentTransactionsCard(context),
          _recentTransactionsCard(context),
          _recentTransactionsCard(context),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  _recentTransactionsCard(context) {
    oweCost() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "You owe",
            style: FontConfig.overline().copyWith(
              color: ColorConfig.midnight.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "\$5",
            style: FontConfig.caption(),
          ),
        ],
      );
    }

    return SizedBox(
      width: 150,
      //color: Colors.red,
      child: CardWidget(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //group name widget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trip", style: FontConfig.body2()),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: ColorConfig.primarySwatch,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            //box count
            oweCost(),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData({this.x, this.y});
  final String? x;
  final double? y;
}
