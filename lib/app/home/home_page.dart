import 'package:dongi/constants/color_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../widgets/appbar/appbar.dart';
import 'home_widget.dart';

class HomePage extends ConsumerWidget with HomeWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          //const SizedBox(height: 16),
          expenseSummery(),
          const SizedBox(height: 30),
          recentGroup(),
          const SizedBox(height: 30),
          weeklyAnalytic(context),
          const SizedBox(height: 30),
          recentTransaction(context),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
