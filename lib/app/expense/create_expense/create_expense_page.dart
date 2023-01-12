import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/text_field/custom_text_field.dart';
import 'create_expense_widget.dart';

class CreateExpensePage extends ConsumerWidget with CreateExpenseWidget {
  const CreateExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(title: "Create Expense"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CardWidget(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        amountRow(),
                        const SizedBox(height: 10),
                        const TextFieldWidget(hintText: "Title"),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            categoryCard(),
                            const SizedBox(width: 10),
                            dateCard(),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CardWidget(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        madeByButton(),
                        const SizedBox(height: 10),
                        splitBetweenButton(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  descriptionCard(),
                ],
              ),
            ),
            createButton(),
          ],
        ),
      ),
    );
  }
}
