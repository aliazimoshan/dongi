import 'package:dongi/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'home_widget.dart';

class HomePage extends ConsumerWidget with HomeWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          expenseSummery(),
          const SizedBox(height: 20),
          recentGroup(),
          const SizedBox(height: 20),
          weeklyAnalytic(context),
          const SizedBox(height: 20),
          recentTransaction(),
        ],
      ),
    );
  }
}
