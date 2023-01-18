import 'package:dongi/constants/font_config.dart';
import 'package:dongi/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/checkbox/checkbox_widget.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import 'split_view_model.dart';

class SplitWidget {
  friendList(List<String> friends, WidgetRef ref) {
    final provider = ref.watch(friendsSelectorProvider);

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

    return Expanded(
      child: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            child: ListTileCard(
              leading: cardIcon(),
              borderColor: provider.contains(friends[index])
                  ? ColorConfig.primarySwatch
                  : Colors.transparent,
              titleString: friends[index],
              onTap: () => ref
                  .read(friendsSelectorProvider.notifier)
                  .select(friends[index]),
            ),
          );
        },
      ),
    );
  }

  actionButton(List<String> friends, WidgetRef ref) {
    final friendViewModel = ref.watch(friendsSelectorProvider);
    final splitViewModel = ref.watch(splitProvider(10000).notifier);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 64,
                  child: CardWidget(
                    color: ColorConfig.primarySwatch,
                    child: Row(
                      children: [
                        CheckboxWidget(
                          value: friendViewModel.length == friends.length,
                          onChanged: (value) => ref
                              .read(friendsSelectorProvider.notifier)
                              .addAll(friends),
                        ),
                        Text(
                          "All",
                          style: FontConfig.body2().copyWith(
                            color: ColorConfig.pureWhite,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          splitViewModel.toString(),
                          style: FontConfig.body2().copyWith(
                            color: ColorConfig.pureWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CardWidget(
                color: ColorConfig.primarySwatch,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Icon(
                    Icons.check,
                    color: ColorConfig.pureWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
