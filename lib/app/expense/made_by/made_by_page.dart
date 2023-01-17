import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../widgets/appbar/appbar.dart';
import 'made_by_widget.dart';

class MadeByPage extends ConsumerWidget with MadeByWidget {
  MadeByPage({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBarWidget(title: "Expense made by"),
        body: friendList(friends, ref));
  }
}
