import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import 'made_by_widget.dart';

class MadeByPage extends ConsumerWidget {
  const MadeByPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(title: "Expense made by"),
      body: const MadeByFriendListWidget(),
    );
  }
}
