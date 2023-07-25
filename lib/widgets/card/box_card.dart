import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/box/controller/box_controller.dart';
import '../../constants/font_config.dart';
import '../../core/utils.dart';
import '../../models/box_model.dart';
import '../../models/group_model.dart';
import '../../router/router_notifier.dart';
import '../image/image_widget.dart';
import '../long_press_menu/long_press_menu.dart';
import 'card.dart';

class BoxCardWidget extends ConsumerWidget {
  final BoxModel boxModel;
  final GroupModel groupModel;

  const BoxCardWidget({
    super.key,
    required this.boxModel,
    required this.groupModel,
  });

  ///* Popup menu
  //_popupButton(BoxModel boxModel) {
  //  List<String> items = ["Edit", "Delete"];

  //  return Consumer(
  //    builder: (context, ref, child) {
  //      return PopupMenuButton<String>(
  //        padding: EdgeInsets.zero,
  //        child: const Icon(Icons.more_vert_outlined),
  //        itemBuilder: (BuildContext context) {
  //          return items
  //              .map(
  //                (val) => PopupMenuItem<String>(
  //                  child: Text(val),
  //                  onTap: () {
  //                    if (val == items[0]) {
  //                      //  Edit dropdown action
  //                    } else {
  //                      //  Delete dropdown action
  //                    }
  //                  },
  //                ),
  //              )
  //              .toList();
  //        },
  //      );
  //    },
  //  );
  //}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    deleteBox() async {
      await ref.read(boxNotifierProvider.notifier).deleteBox(boxModel);
      if (context.mounted) {
        showSnackBar(context, "box deleted successfully");
      }
    }

    // List<CupertinoContextMenuAction> menuItems = [
    //  CupertinoContextMenuAction(
    //    child: const Text('Edit'),
    //    onPressed: () => context.push(RouteName.updateBox, extra: box),
    //  ),
    //  CupertinoContextMenuAction(
    //    onPressed: deleteBox,
    //    child: const Text('Delete'),
    //  ),
    //];

    List<PopupMenuEntry> menuItems = [
      PopupMenuItem(
        child: const Text('Edit'),
        onTap: () => context.push(
          RouteName.updateBox,
          extra: {"boxModel": boxModel},
        ),
      ),
      PopupMenuItem(
        onTap: deleteBox,
        child: const Text('Delete'),
      ),
    ];

    return LongPressMenuWidget(
      onTap: () => context.push(
        RouteName.boxDetail(boxModel.id),
        extra: {"boxModel": boxModel, "groupModel": groupModel},
      ),
      items: menuItems,
      child: CardWidget(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImageWidget(imageUrl: boxModel.image),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      boxModel.title,
                      style: FontConfig.body1(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  //_popupButton(box)
                ],
              ),
              const Spacer(flex: 3),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Total bill",
                          style: FontConfig.caption(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '\$${boxModel.total}',
                          style: FontConfig.body2()
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Members",
                          style: FontConfig.caption(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          boxModel.boxUsers.length.toString(),
                          style: FontConfig.body2()
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
