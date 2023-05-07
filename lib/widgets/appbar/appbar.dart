import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app/auth/controller/auth_controller.dart';
import '../../constants/color_config.dart';

class AppBarWidget extends PreferredSize {
  final String? title;
  AppBarWidget({
    super.key,
    this.title,
  }) : super(
          preferredSize: const Size.fromHeight(70),
          child: appBarChild(title),
        );
}

Widget appBarChild(String? title) {
  return Consumer(
    builder: (context, ref, child) {
      return Container(
        color: ColorConfig.primarySwatch,
        child: Column(
          children: [
            Expanded(
              child: AppBar(
                elevation: 0,
                centerTitle: false,
                title: Text(title ?? "Dongi"),
                actions: [
                  IconButton(
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorConfig.darkGrey,
                      ),
                    ),
                    onPressed: () => ref
                        .read(authControllerProvider.notifier)
                        .logout(context),
                  )
                ],
              ),
            ),
            Container(
              height: 16,
              decoration: BoxDecoration(
                color: ColorConfig.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
