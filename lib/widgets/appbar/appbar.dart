import 'package:flutter/material.dart';
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
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          height: 16,
          decoration: BoxDecoration(
            color: ColorConfig.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
        )
      ],
    ),
  );
}
