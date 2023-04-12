import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/color_config.dart';
import '../../constants/content/onboarding_contents.dart';
import 'onboarding_controller.dart';
import 'onboarding_widget.dart';

class OnboardingPage extends ConsumerWidget with OnboardingWidget {
  final PageController _controller = PageController();

  OnboardingPage({super.key});

  final List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(onboardingProvider.notifier);
    final currentPage = ref.watch(onboardingProvider);
    return Scaffold(
      backgroundColor: colors[currentPage],
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        onPageChanged: provider.onPageChanged,
        itemCount: onboardingContents.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      onboardingContents[index].image,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    color: ColorConfig.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(index),
                      animatedDots(index, currentPage),
                      actionButtons(context, index, _controller)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
