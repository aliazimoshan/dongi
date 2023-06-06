import 'package:dongi/widgets/appbar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import './box_detail_widget.dart';

class BoxDetailPage extends ConsumerWidget {
  final String boxId;
  const BoxDetailPage(this.boxId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      //appBar: AppBar(elevation: 0),
      body: SliverAppBarWidget(
        collapsedHeight: 120,
        height: 200,
        appbarTitle: const TotalExpenseBoxDetail(),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            FriendListBoxDetail(),
            CategoryListBoxDetail(),
            ExpenseListBoxDetail(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButtonWidget(
        title: 'Box',
      ),
    );
  }
}
