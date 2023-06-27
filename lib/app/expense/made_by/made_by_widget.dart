import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import 'made_by_controller.dart';

class MadeByWidget {
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
