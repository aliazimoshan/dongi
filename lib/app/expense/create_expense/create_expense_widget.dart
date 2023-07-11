import 'package:dongi/router/router_notifier.dart';
import 'package:dongi/widgets/list_tile/list_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../constants/color_config.dart';
import '../../../widgets/button/button.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/card/grey_card.dart';
import '../../../widgets/text_field/text_field.dart';
import '../controller/expense_controller.dart';

class CreateExpenseAmount extends ConsumerWidget {
  const CreateExpenseAmount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            hintText: "10,000",
            fillColor: ColorConfig.white,
            onChanged: (value) =>
                ref.read(splitCostProvider.notifier).state.text = value!,
          ),
        ),
        const SizedBox(width: 10),
        const GreyCardWidget(
          width: 50,
          height: 50,
          child: Center(
            child: Text("USD"),
          ),
        ),
      ],
    );
  }
}

class CreateExpenseCategory extends ConsumerWidget {
  const CreateExpenseCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: CardWidget(
        backColor: ColorConfig.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category_outlined, color: ColorConfig.primarySwatch),
            const SizedBox(width: 5),
            const Text("Category"),
          ],
        ),
      ),
    );
  }
}

class CreateExpenseDate extends ConsumerWidget {
  const CreateExpenseDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: CardWidget(
        backColor: ColorConfig.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.date_range,
              color: ColorConfig.primarySwatch,
            ),
            const SizedBox(width: 5),
            const Text("20 Nov, 2020"),
          ],
        ),
      ),
    );
  }
}

class CreateExpenseAction extends ConsumerWidget {
  const CreateExpenseAction({super.key});

  _actionButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required Function()? onTap,
  }) {
    return ListTileCard(
      onTap: onTap,
      backColor: ColorConfig.white,
      titleString: title,
      subtitleString: subtitle,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorConfig.pureWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CardWidget(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          _actionButton(
            title: "made by",
            subtitle: "Person name",
            icon: Icons.account_box,
            onTap: () => context.push(RouteName.expenseMadeBy),
          ),
          const SizedBox(height: 10),
          _actionButton(
            title: "split between",
            subtitle: "Splitting method",
            icon: Icons.call_split,
            onTap: () => context.push(RouteName.expenseSplit),
          ),
        ],
      ),
    );
  }
}

class CreateExpenseDescription extends ConsumerWidget {
  final TextEditingController expenseDescription;
  const CreateExpenseDescription(this.expenseDescription, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CardWidget(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          CardWidget(
            backColor: ColorConfig.white,
            child: SizedBox(
              width: 75,
              height: 75,
              child: Icon(
                Icons.description_outlined,
                color: ColorConfig.primarySwatch,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFieldWidget(
              controller: expenseDescription,
              hintText: "Description",
              maxLines: 3,
              fillColor: ColorConfig.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CreateExpenseCreateButton extends ConsumerWidget {
  final TextEditingController expenseTitle;
  final TextEditingController expenseDescription;
  final GlobalKey<FormState> formKey;
  final String groupId;
  final String boxId;

  const CreateExpenseCreateButton({
    required this.expenseTitle,
    required this.expenseDescription,
    required this.formKey,
    required this.groupId,
    required this.boxId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: ButtonWidget(
          isLoading: ref.watch(expenseNotifierProvider).maybeWhen(
                loading: () => true,
                orElse: () => false,
              ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              ref.read(expenseNotifierProvider.notifier).addExpense(
                    expenseTitle: expenseTitle,
                    expenseDescription: expenseDescription,
                    groupId: groupId,
                    boxId: boxId,
                  );
            }
          },
          title: "Create",
          textColor: ColorConfig.secondary,
        ),
      ),
    );
  }
}
