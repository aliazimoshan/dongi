import 'package:dongi/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constants/color_config.dart';
import 'home_widget.dart';

class HomePage extends ConsumerWidget with HomeWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          expenseSummery(),
        ],
      ),
    );
  }
}
