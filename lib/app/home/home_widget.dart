import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import '../../constants/size_config.dart';
import '../../models/group_model.dart';
import '../../router/router_notifier.dart';
import '../../widgets/card/card.dart';
import '../../widgets/error/error.dart';
import '../../widgets/image/image_widget.dart';
import '../auth/controller/auth_controller.dart';

class HomeExpenseSummery extends ConsumerWidget {
  const HomeExpenseSummery({super.key});
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
}

class HomeRecentGroup extends StatelessWidget {
  final List<GroupModel> groups;
  const HomeRecentGroup(this.groups, {super.key});

  @override
  Widget build(BuildContext context) {
    moreCircle() {
      return InkWell(
        onTap: () => context.push(RouteName.groupList),
        child: Container(
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
        ),
      );
    }

    return Column(
      children: [
        //* Group title
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 10),
          child: Row(
            children: [
              Text(
                "Groups",
                style: FontConfig.h6(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 172,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16),
              Row(
                children:
                    groups.map((group) => GroupCardWidget(group)).toList(),
              ),
              moreCircle(),
            ],
          ),
        ),
      ],
    );
  }
}

class GroupCardWidget extends ConsumerWidget {
  final GroupModel group;
  const GroupCardWidget(this.group, {super.key});

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
          group.boxIds.length.toString(),
          style: FontConfig.body2(),
        ),
      ],
    );
  }

  Positioned positionedCircleBox({Color? color, double? left, String? url}) {
    return Positioned(
      left: left,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          color != null
              ? color.withOpacity(0.3)
              : Colors.black54.withOpacity(0.3),
          BlendMode.colorBurn,
        ),
        child: ImageWidget(
          width: 32,
          height: 32,
          //color: color,
          imageUrl: url,
          borderEnable: url == null ? false : true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupMember = ref.watch(getUsersListData(group.groupUsers));
    return CardWidget(
      onTap: () => context.push(RouteName.groupDetail(group.id)),
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
                ImageWidget(
                  width: 40,
                  height: 40,
                  imageUrl: group.image,
                  borderRadius: 5,
                ),
                const SizedBox(width: 5),
                Text(group.title, style: FontConfig.body2())
              ],
            ),
            const SizedBox(height: 15),
            //box count
            boxCount(),
            const SizedBox(height: 15),
            //member row
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Members",
                  style: FontConfig.overline().copyWith(
                    color: ColorConfig.midnight.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: groupMember.when(
                        loading: () {
                          return Stack(
                            children: group.groupUsers
                                .asMap()
                                .entries
                                .map(
                                  (val) => positionedCircleBox(
                                    color: Colors.grey[(900 - (val.key * 100))],
                                    left: val.key == group.groupUsers.length - 1
                                        ? null
                                        : val.key + 1 * 10,
                                  ),
                                )
                                .toList(),
                          );
                          //return Stack(
                          //  children: [
                          //    positionedCircleBox(
                          //      color: Colors.grey.shade900,
                          //      left: 100,
                          //    ),
                          //    positionedCircleBox(
                          //      color: Colors.grey.shade800,
                          //      left: 80,
                          //    ),
                          //    positionedCircleBox(
                          //      color: Colors.grey.shade700,
                          //      left: 60,
                          //    ),
                          //    positionedCircleBox(
                          //      color: Colors.grey.shade600,
                          //      left: 40,
                          //    ),
                          //    positionedCircleBox(
                          //      color: Colors.grey.shade400,
                          //      left: 20,
                          //    ),
                          //    positionedCircleBox(
                          //      color: Colors.grey.shade300,
                          //    ),
                          //  ],
                          //);
                        },
                        error: (error, stackTrace) => ErrorTextWidget(error),
                        data: (data) {
                          return Stack(
                            children: data
                                .asMap()
                                .entries
                                .map(
                                  (val) => positionedCircleBox(
                                    url: val.value.profileImage,
                                    color: Colors.grey[(900 - (val.key * 100))],
                                    left: val.key == group.groupUsers.length - 1
                                        ? null
                                        : val.key + 1 * 10,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConfig.white,
                      ),
                      child: Icon(
                        Icons.share,
                        color: ColorConfig.primarySwatch,
                        size: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWeeklyAnalytic extends StatelessWidget {
  HomeWeeklyAnalytic({super.key});

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

  @override
  Widget build(BuildContext context) {
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
}

class HomeRecentTransaction extends ConsumerWidget {
  const HomeRecentTransaction({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _recentTransactionsTitle(),
        _recentTransactionsCardList(context),
      ],
    );
  }
}

class ChartData {
  ChartData({this.x, this.y});
  final String? x;
  final double? y;
}
