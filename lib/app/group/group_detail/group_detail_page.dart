import 'package:dongi/widgets/appbar/sliver_appbar.dart';
import 'package:dongi/widgets/error/error.dart';
import 'package:dongi/widgets/floating_action_button/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/loading/loading.dart';
import '../../box/controller/box_controller.dart';
import '../controller/group_controller.dart';
import './group_detail_widget.dart';

class GroupDetailPage extends ConsumerWidget {
  final String groupId;
  const GroupDetailPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupDetail = ref.watch(getGroupDetailProvider(groupId));
    final boxesInGroup = ref.watch(getBoxesInGroupProvider(groupId));

    /// by using listen we are not gonna rebuild our app
    ref.listen<GroupState>(
      groupNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getGroupsProvider),
          error: (message) => showSnackBar(context, message),
        );
      },
    );

    ref.listen<BoxState>(
      boxNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getBoxesInGroupProvider(groupId)),
          error: (message) => showSnackBar(context, message),
        );
      },
    );

    return groupDetail.when(
      loading: () => const LoadingWidget(),
      error: (error, stackTrace) => ErrorTextWidget(error),
      data: (data) => Scaffold(
        backgroundColor: ColorConfig.primarySwatch,
        //appBar: AppBar(elevation: 0),
        body: SliverAppBarWidget(
          collapsedHeight: 90,
          height: 200,
          appbarTitle: GroupDetailTitle(groupName: data.title),
          image: data.image,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              GroupDetailInfo(groupModel: data),
              GroupDetailFriendList(userIds: data.groupUsers),
              //* Get boxes
              boxesInGroup.when(
                loading: () => const LoadingWidget(),
                error: (error, stackTrace) => ErrorTextWidget(error),
                data: (data) => GroupDetailBoxGrid(boxList: data),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButtonWidget(
          title: "Box",
          onPressed: () => context.push(
            RouteName.createBox,
            extra: groupId,
          ),
        ),
      ),
    );
  }
}
