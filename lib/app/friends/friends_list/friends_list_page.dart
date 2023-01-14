import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/color_config.dart';
import '../../../widgets/appbar/appbar.dart';
import './friends_list_screen.dart';

class FriendsListPage extends ConsumerWidget with FriendsListWidget {
  const FriendsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorConfig.background,
      appBar: AppBarWidget(title: 'Friends List'),
      body: friendsList(),
    );
  }
}
