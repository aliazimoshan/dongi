import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import '../../constants/size_config.dart';
import '../../widgets/appbar/sliver_appbar.dart';
import './statistic_widget.dart';

class StatisticPage extends ConsumerWidget with StatisticWidget {
  StatisticPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '',
          style: FontConfig.h6().copyWith(color: ColorConfig.pureWhite),
        ),
      ),
      body: SliverAppBarWidget(
        height: SizeConfig.height(context) / 3.2,
        appbarTitle: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              filters(),
              charts(),
            ],
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            categories(),
            expensesList(),
          ],
        ),
      ),
    );
  }
}
