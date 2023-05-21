import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constants/color_config.dart';
import '../../widgets/appbar/appbar.dart';
import 'home_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          const HomeExpenseSummery(),
          const SizedBox(height: 30),
          const HomeRecentGroup(),
          const SizedBox(height: 30),
          HomeWeeklyAnalytic(),
          const SizedBox(height: 30),
          const HomeRecentTransaction(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
