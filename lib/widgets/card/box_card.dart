import 'package:dongi/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app/box/controller/box_controller.dart';
import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import '../../models/box_model.dart';
import '../../router/router_notifier.dart';
import '../long_press_menu/long_press_menu.dart';
import 'card.dart';

class BoxCardWidget extends ConsumerWidget {
  final BoxModel box;

  const BoxCardWidget(this.box, {super.key});

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
      await ref.read(boxNotifierProvider.notifier).deleteBox(box);
      if (context.mounted) {
        showSnackBar(context, "box deleted successfully");
      }
    }

    List<PopupMenuEntry> menuItems = [
      PopupMenuItem(
        child: const Text('Edit'),
        onTap: () => context.push(RouteName.updateBox, extra: box),
      ),
      PopupMenuItem(
        onTap: deleteBox,
        child: const Text('Delete'),
      ),
    ];

    return LongPressMenuWidget(
      items: menuItems,
      onTap: () => context.push(
        RouteName.boxDetail(box.id),
        extra: {"boxId": box.id, "groupId": box.groupId},
      ),
      child: CardWidget(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: ColorConfig.darkGrey,
                        shape: BoxShape.circle,
                        image: box.image != null
                            ? DecorationImage(
                                image: NetworkImage(box.image!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        box.title,
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
                            '\$${box.total}',
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
                            box.boxUsers.length.toString(),
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

                //const Spacer(),
                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
