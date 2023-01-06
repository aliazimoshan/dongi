import 'package:dongi/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'group_widget.dart';

class GroupPage extends ConsumerWidget with GroupWidget {
  GroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(
        children: [],
      ),
    );
  }
}
