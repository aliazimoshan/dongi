import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/utils.dart';
import '../../../router/router_notifier.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/floating_action_button/floating_action_button.dart';
import '../controller/group_controller.dart';
import 'group_list_widget.dart';

class GroupListPage extends ConsumerWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final controller = useState<PanelController>(PanelController());
    final groupList = ref.watch(getGroupsProvider);

    /// by using listen we are not gonna rebuild our app
    ref.listen<GroupState>(
      groupNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () => ref.refresh(getGroupsProvider),
          error: (message) {
            showSnackBar(context, message);
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBarWidget(title: "Groups"),
      floatingActionButton: FABWidget(
        title: "Group",
        onPressed: () => context.push(RouteName.createGroup),
        //onPressed: () => controller.value.open(),
      ),
      body: groupList.when(
        skipLoadingOnRefresh: false,
        //skipLoadingOnReload: true,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (data) => RefreshIndicator(
          child: GroupListView(data),
          onRefresh: () async => ref.refresh(getGroupsProvider),
        ),
      ),
    );
    //return Stack(
    //  children: [
    //    Scaffold(
    //      appBar: AppBarWidget(title: "Groups"),
    //      floatingActionButton: FABWidget(
    //        title: "Group",
    //        onPressed: () => controller.value.open(),
    //      ),
    //      body: groupList.when(
    //        skipLoadingOnRefresh: false,
    //        //skipLoadingOnReload: true,
    //        loading: () => const Center(child: CircularProgressIndicator()),
    //        error: (error, stackTrace) => Center(child: Text(error.toString())),
    //        data: (data) => RefreshIndicator(
    //          onRefresh: () async => ref.refresh(getGroupsProvider),
    //          child: GroupListView(data),
    //        ),
    //      ),
    //    ),
    //    SlidingUpPanel(
    //      backdropEnabled: true,
    //      controller: controller.value,
    //      panelSnapping: false,
    //      minHeight: 0,
    //      maxHeight: 700,
    //      borderRadius: const BorderRadius.only(
    //        topLeft: Radius.circular(16),
    //        topRight: Radius.circular(16),
    //      ),
    //      panel: CreateGroupPage(),
    //    ),
    //  ],
    //);
  }
}
