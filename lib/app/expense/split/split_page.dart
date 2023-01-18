import 'package:dongi/app/expense/split/split_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import 'split_widget.dart';

class SplitPage extends ConsumerStatefulWidget {
  const SplitPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplitPageState();
}

class _SplitPageState extends ConsumerState<SplitPage> with SplitWidget {
  final List<String> friends = [
    "Me",
    "Friend name 1",
    "Friend name 2",
    "Friend name 3",
    "Friend name 4",
    "Friend name 5",
    "Friend name 6",
    "Friend name 7",
  ];

  @override
  void initState() {
    ref.read(friendsSelectorProvider).addAll(friends);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Expense made by"),
      body: Column(
        children: [
          friendList(friends, ref),
          actionButton(friends, ref),
        ],
      ),
    );
  }
}
