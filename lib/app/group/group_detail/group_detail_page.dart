import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/appbar/sliver_appbar.dart';
import '../../../widgets/error/error.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../../../widgets/loading/loading.dart';
import '../controller/group_controller.dart';
import './group_detail_widget.dart';

class GroupDetailPage extends ConsumerWidget {
  final String groupId;
  const GroupDetailPage({super.key, required this.groupId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupDetail = ref.watch(getGroupDetailProvider(groupId));

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

    return Scaffold(
      body: groupDetail.when(
        loading: () => const LoadingWidget(),
        error: (error, stackTrace) => ErrorTextWidget(error),
        data: (data) => Scaffold(
          //backgroundColor: ColorConfig.primarySwatch,
          //appBar: AppBar(elevation: 0),
          body: SliverAppBarWidget(
            //collapsedHeight: 90,
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
                GroupDetailBoxGrid(groupId: groupId)
              ],
            ),
          ),
          floatingActionButton: FABWidget(
            title: "Box",
            onPressed: () => context.push(
              RouteName.createBox,
              extra: groupId,
            ),
          ),
        ),
      ),
    );
  }
}
