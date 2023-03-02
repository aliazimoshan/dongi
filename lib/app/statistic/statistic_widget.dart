import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import '../../widgets/card/category_card.dart';
import '../../widgets/list_tile/list_tile_card.dart';

class StatisticWidget {
  //static SplineType? _spline = SplineType.natural;
  static final TooltipBehavior _tooltipBehavior =
      TooltipBehavior(enable: true, header: '', canShowMarker: false);

  /// *----- date filters
  filters() {
    Expanded filterCardItem({required String title}) {
      return Expanded(
        child: Container(
          height: 35,
          decoration: BoxDecoration(
            color: ColorConfig.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              title,
              style: FontConfig.button(),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        filterCardItem(title: 'day'),
        const SizedBox(width: 10),
        filterCardItem(title: 'week'),
        const SizedBox(width: 10),
        filterCardItem(title: 'month'),
        const SizedBox(width: 10),
        filterCardItem(title: 'year'),
      ],
    );
  }

  /// *----- chart section
  charts() {
    final List<ChartData> chartData = <ChartData>[
      ChartData(title: "SAT", y: 5, x: 1),
      ChartData(title: "SUN", y: 2, x: 2),
      ChartData(title: "MON", y: 8, x: 3),
      ChartData(title: "TUE", y: 4, x: 4),
      ChartData(title: "WEN", y: 7, x: 5),
      ChartData(title: "THU", y: 5, x: 6),
    ];

    ChartAxisLabel labelFormat(AxisLabelRenderDetails axisLabelRenderArgs) {
      return ChartAxisLabel(
        chartData[int.parse(axisLabelRenderArgs.text) - 1].title,
        FontConfig.overline().copyWith(color: ColorConfig.white),
      );
    }

    return Container(
      // color: Colors.blue,
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      height: 125,
      child: SfCartesianChart(
        margin: EdgeInsets.zero,
        plotAreaBorderWidth: 0,
        primaryYAxis: CategoryAxis(isVisible: false),
        primaryXAxis: NumericAxis(
          //labelStyle: const TextStyle(color: Colors.white),
          axisLine: const AxisLine(width: 0),
          interval: 1,
          labelPosition: ChartDataLabelPosition.outside,
          majorTickLines: const MajorTickLines(width: 0),
          majorGridLines: MajorGridLines(
            width: 1,
            color: ColorConfig.white.withOpacity(0.1),
          ),
          // labelFormat: _labelFormat('{value}'),
          axisLabelFormatter: labelFormat,
        ),
        series: <ChartSeries<ChartData, double>>[
          SplineSeries<ChartData, double>(
            animationDuration: 1000,
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
            name: 'Unit Sold',
            // borderRadius: BorderRadius.circular(50),
            // spacing: 0.5,
            color: ColorConfig.primarySwatch25,
          ),
        ],
        tooltipBehavior: _tooltipBehavior,
      ),
    );
  }

  /// *----- categories
  categories() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(
                'Categories',
                style: FontConfig.body1(),
              ),
              const Spacer(),
              Text(
                'show more',
                style: FontConfig.overline().copyWith(
                  color: ColorConfig.primarySwatch.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 115,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(width: 16),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Row(
                    children: const [
                      CategoryCardWidget(
                        name: 'category name',
                        balance: '\$ 210,000',
                      ),
                      SizedBox(width: 10),
                    ],
                  );
                },
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }

  /// *----- expenses
  expensesList() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 25, 16, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expenses',
            style: FontConfig.body1(),
          ),
          const SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    ListTileCard(
                      leading: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ColorConfig.primarySwatch,
                          shape: BoxShape.circle,
                        ),
                      ),
                      titleString: 'expense title',
                      trailing: const Text("\$53"),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              }),
        ],
      ),
    );
  }

  /// Returns the list of chart series which need to render on the spline chart.
  // List<SplineSeries<_ChartData, num>> _getSplineTypesSeries() {
  //   return <SplineSeries<_ChartData, num>>[
  //     SplineSeries<_ChartData, num>(
  //       /// To set the spline type here.
  //       splineType: _spline,
  //       dataSource: <_ChartData>[
  //         _ChartData(1, 0.05),
  //         _ChartData(2, 1),
  //         _ChartData(3, 0.03),
  //         _ChartData(4, 2),
  //         _ChartData(5, -0.5),
  //         _ChartData(6, 0.5),
  //       ],
  //       xValueMapper: (_ChartData sales, _) => sales.x,
  //       yValueMapper: (_ChartData sales, _) => sales.y,
  //       width: 2,
  //     )
  //   ];
  // }
}

/// Private class for storing the spline series data points.
// class _ChartData {
//   _ChartData(this.x, this.y);
//   final double x;
//   final double y;
// }

class ChartData {
  ChartData({this.x, this.y, required this.title});
  final String title;
  final double? x;
  final double? y;
}
