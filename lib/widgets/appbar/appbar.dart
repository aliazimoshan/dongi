import 'package:flutter/material.dart';
import '../../constants/color_config.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({super.key})
      : super(
          preferredSize: const Size.fromHeight(70),
          child: appBarChild(),
        );
}

Widget appBarChild() {
  return Container(
    color: ColorConfig.primarySwatch,
    child: Column(
      children: [
        Expanded(
          child: AppBar(
            elevation: 0,
            centerTitle: false,
            title: const Text("Dongi"),
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
          height: 15,
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
