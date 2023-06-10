import 'package:dongi/widgets/appbar/sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../../../widgets/loading/loading.dart';
import '../controller/box_controller.dart';
import './box_detail_widget.dart';

class BoxDetailPage extends ConsumerWidget {
  final String boxId;
  const BoxDetailPage(this.boxId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxDetail = ref.watch(getBoxDetailProvider(boxId));

    return Scaffold(
      backgroundColor: ColorConfig.primarySwatch,
      //appBar: AppBar(elevation: 0),
      body: boxDetail.when(
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => ErrorTextWidget(error),
        data: (data) {
          return SliverAppBarWidget(
            image: data.image,
            collapsedHeight: 120,
            height: 200,
            appbarTitle: const TotalExpenseBoxDetail(),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FriendListBoxDetail(users: data.boxUser),
                const CategoryListBoxDetail(),
                const ExpenseListBoxDetail(),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButtonWidget(title: 'Expense'),
    );
  }
}
