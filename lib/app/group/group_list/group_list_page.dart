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
    final groupList = ref.watch(getGroupsProvider);

    /// by using listen we are not gonna rebuild our app
    ref.listen<GroupState>(
      groupNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          loaded: () {
            showSnackBar(context, "Successfully deleted");
            //update list of group when back
            //.value is for prevent dart warning (it will work without .value)
            ref.refresh(refreshGroupsProvider).value;
          },
          error: (message) {
            showSnackBar(context, message);
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBarWidget(title: "Groups"),
      //floatingActionButton: FloatingActionButton.extended(
      //  extendedPadding: EdgeInsets.fromLTRB(12, 0, 16, 0),
      //  backgroundColor: ColorConfig.midnight,
      //  onPressed: () {},
      //  label: Row(
      //    children: [
      //      Icon(
      //        Icons.add,
      //        size: 18,
      //        color: ColorConfig.secondary,
      //      ),
      //      SizedBox(width: 2),
      //      Text(
      //        "Group",
      //        style: TextStyle(color: ColorConfig.secondary),
      //      ),
      //    ],
      //  ),
      //),
      floatingActionButton: FloatingActionButtonWidget(
        title: "Group",
        onPressed: () => context.push(RouteName.createGroup),
      ),
      body: groupList.when(
        //skipLoadingOnRefresh: true,
        //skipLoadingOnReload: true,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        data: (data) => RefreshIndicator(
          child: GroupListView(groupModel: data),
          onRefresh: () => ref.refresh(refreshGroupsProvider.future),
        ),
      ),
    );
  }
}
