import 'package:dongi/constants/color_config.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/card/card.dart';
import '../../../widgets/text_field/text_field.dart';
import 'create_expense_widget.dart';

class CreateExpensePage extends ConsumerWidget {
  final String boxId;
  final String groupId;
  const CreateExpensePage({
    super.key,
    required this.boxId,
    required this.groupId,
  });

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
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const CreateExpenseAmount(),
                        const SizedBox(height: 10),
                        TextFieldWidget(
                          hintText: "Title",
                          fillColor: ColorConfig.white,
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            CreateExpenseCategory(),
                            SizedBox(width: 10),
                            CreateExpenseDate()
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CreateExpenseAction(),
                  const SizedBox(height: 20),
                  const CreateExpenseDescription(),
                ],
              ),
            ),
            const CreateExpenseCreateButton()
          ],
        ),
      ),
    );
  }
}
