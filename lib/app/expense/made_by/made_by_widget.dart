import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import 'made_by_controller.dart';

class MadeByWidget {
  //multipleSwitch() {
  //  return Padding(
  //    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //    child: CardWidget(
  //      color: ColorConfig.primarySwatch,
  //      child: SizedBox(
  //        height: 50,
  //        child: Row(
  //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //          children: [
  //            Text(
  //              "multiple people",
  //              style: FontConfig.body2().copyWith(
  //                color: ColorConfig.pureWhite,
  //              ),
  //            ),
  //            Container(
  //              decoration: BoxDecoration(
  //                borderRadius: BorderRadius.circular(20.0),
  //                border: Border.all(color: ColorConfig.pureWhite),
  //              ),
  //              padding: const EdgeInsets.all(5),
  //              child: SizedBox(
  //                width: 50,
  //                height: 20,
  //                child: Switch(
  //                  onChanged: (value) {},
  //                  value: true,
  //                  activeColor: ColorConfig.darkGrey,
  //                ),
  //              ),
  //            ),
  //          ],
  //        ),
  //      ),
  //    ),
  //  );
  //}

  friendList(List<String> friends, WidgetRef ref) {
    cardIcon() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            //width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: ColorConfig.primarySwatch,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: ListTileCard(
            leading: cardIcon(),
            borderColor: ref.watch(friendSelectorProvider) == friends[index]
                ? ColorConfig.primarySwatch
                : Colors.transparent,
            titleString: friends[index],
            onTap: () => ref.read(friendSelectorProvider.notifier).state =
                friends[index],
          ),
        );
      },
    );
  }
}
