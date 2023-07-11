import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import '../../box/controller/box_controller.dart';
import '../controller/expense_controller.dart';

class MadeByFriendListWidget extends ConsumerWidget {
  const MadeByFriendListWidget({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.read(userInBoxStoreProvider);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: ListTileCard(
            leading: cardIcon(),
            borderColor: ref.watch(expenseCreatorProvider) == users[index].id
                ? ColorConfig.primarySwatch
                : Colors.transparent,
            titleString: users[index].userName,
            onTap: () => ref.read(expenseCreatorProvider.notifier).state =
                users[index].id,
          ),
        );
      },
    );
  }
}
