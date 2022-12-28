import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../constants/color_config.dart';
import 'home_widget.dart';

class HomePage extends ConsumerWidget with HomeWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
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
        ),
      ),
      body: Column(
        children: [
          expenseSummery(),
        ],
      ),
    );
  }
}
