import 'package:dongi/constants/font_config.dart';
import 'package:dongi/extensions/round_double.dart';
import 'package:dongi/models/user_model.dart';
import 'package:dongi/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/checkbox/checkbox_widget.dart';
import '../../../widgets/list_tile/list_tile_card.dart';
import '../controller/expense_controller.dart';

class SplitFriendListWidget extends ConsumerWidget {
  final List<UserModel> users;
  const SplitFriendListWidget(this.users, {super.key});

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
    final selectedUsers = ref.watch(splitUserProvider);

    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
            child: ListTileCard(
              leading: cardIcon(),
              titleString: users[index].userName,
              onTap: () => ref
                  .watch(splitUserProvider.notifier)
                  .select(users[index].id!),
              trailing: CheckboxWidget(
                borderColor: ColorConfig.primarySwatch,
                value: selectedUsers
                    .map((val) => val)
                    .toList()
                    .contains(users[index].id),
                onChanged: (val) => ref
                    .watch(splitUserProvider.notifier)
                    .select(users[index].id!),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SplitActionButtonWidget extends ConsumerWidget {
  final List<UserModel> users;
  final TextEditingController expenseCost;
  const SplitActionButtonWidget({
    super.key,
    required this.users,
    required this.expenseCost,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedUsers = ref.watch(splitUserProvider);

    String splitCostString() {
      int selectedUserLength = selectedUsers.length;

      if (selectedUserLength != 0) {
        double amountPerPerson =
            (int.parse(expenseCost.text.replaceAll(',', '')) /
                    selectedUserLength)
                .fixedDouble();

        if (amountPerPerson > 0) {
          return "\$$amountPerPerson / Person($selectedUserLength)";
        } else {
          return "No one selected";
        }
      } else {
        return "No one selected";
      }
    }

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
                    backColor: ColorConfig.primarySwatch,
                    child: Row(
                      children: [
                        CheckboxWidget(
                          activeColor: ColorConfig.primarySwatch,
                          checkColor: ColorConfig.pureWhite,
                          value: selectedUsers.length == users.length,
                          onChanged: (value) => ref
                              .read(splitUserProvider.notifier)
                              .addAll(users.map((e) => e.id!).toList()),
                        ),
                        Text(
                          "All",
                          style: FontConfig.body2().copyWith(
                            color: ColorConfig.pureWhite,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          splitCostString(),
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
                backColor: ColorConfig.primarySwatch,
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
