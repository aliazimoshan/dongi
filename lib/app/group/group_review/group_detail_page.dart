import 'package:dongi/widgets/appbar/sliver_appbar.dart';
import 'package:dongi/widgets/floating_action_button/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../controller/group_controller.dart';
import './group_detail_widget.dart';

class GroupDetailPage extends ConsumerWidget with GroupDetailWidget {
  final String groupId;
  const GroupDetailPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupDetail = ref.watch(getGroupDetailProvider(groupId));

    return groupDetail.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      data: (data) => Scaffold(
        backgroundColor: ColorConfig.primarySwatch,
        //appBar: AppBar(elevation: 0),
        body: SliverAppBarWidget(
          height: 200,
          appbarTitle: groupName(data.title),
          image: data.image,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              groupInfo(data),
              friendsList(data.members),
              boxesGrid(),
              //expensesList(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButtonWidget(),
      ),
    );
  }
}
