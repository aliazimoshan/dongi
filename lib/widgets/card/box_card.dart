import 'package:dongi/models/box_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app/box/controller/box_controller.dart';
import '../../constants/color_config.dart';
import '../../constants/font_config.dart';
import '../../router/router_notifier.dart';
import 'card.dart';

class BoxCardWidget extends StatelessWidget {
  final BoxModel box;

  const BoxCardWidget(this.box, {super.key});

  ///* Popup menu
  _popupButton(BoxModel boxModel) {
    List<String> items = ["Edit", "Delete"];

    return Consumer(
      builder: (context, ref, child) {
        return PopupMenuButton<String>(
          icon: const Icon(Icons.more_vert_outlined),
          itemBuilder: (BuildContext context) {
            return items
                .map(
                  (val) => PopupMenuItem<String>(
                    child: Text(val),
                    onTap: () {
                      if (val == items[0]) {
                        //  Edit dropdown action
                        context.push(
                          RouteName.updateBox,
                          extra: boxModel,
                        );
                      } else {
                        //  Delete dropdown action
                        ref.read(boxControllerProvider.notifier).deleteBox(
                              context: context,
                              ref: ref,
                              boxModel: boxModel,
                            );
                      }
                    },
                  ),
                )
                .toList();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardWidget(
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
                          ? DecorationImage(image: NetworkImage(box.image!))
                          : null,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      box.title,
                      style: FontConfig.body2(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _popupButton(box)
                ],
              ),
              const Spacer(),
              Text(
                "Total bill",
                style: FontConfig.overline(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                '\$${box.total}',
                style: FontConfig.body2().copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              Text(
                "Split to",
                style: FontConfig.overline(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                box.boxUser.length.toString(),
                style: FontConfig.body2().copyWith(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
