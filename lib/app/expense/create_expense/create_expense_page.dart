import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/utils.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/card/card.dart';
import '../controller/expense_controller.dart';
import 'create_expense_widget.dart';

class CreateExpensePage extends HookConsumerWidget {
  final String boxId;
  final String groupId;
  CreateExpensePage({
    super.key,
    required this.boxId,
    required this.groupId,
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseTitle = useTextEditingController();
    final expenseDescription = useTextEditingController();
    final expenseCost = useTextEditingController();

    /// by using listen we are not gonna rebuild our app
    ref.listen<ExpenseState>(
      expenseNotifierProvider,
      (previous, next) {
        next.whenOrNull(
            loaded: () {
              showSnackBar(context, "Successfully Created!!");
              context.pop();
            },
            error: (message) => showSnackBar(context, message));
      },
    );

    return Scaffold(
      appBar: AppBarWidget(title: "Create Expense"),
      body: Form(
        key: _formKey,
        child: Padding(
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
                          CreateExpenseAmount(expenseCost: expenseCost),
                          const SizedBox(height: 10),
                          CreateExpenseTitle(expenseTitle: expenseTitle),
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
                    CreateExpenseAction(expenseCost: expenseCost),
                    const SizedBox(height: 20),
                    CreateExpenseDescription(expenseDescription),
                  ],
                ),
              ),
              CreateExpenseCreateButton(
                expenseTitle: expenseTitle,
                expenseDescription: expenseDescription,
                expenseCost: expenseCost,
                formKey: _formKey,
                groupId: groupId,
                boxId: boxId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
