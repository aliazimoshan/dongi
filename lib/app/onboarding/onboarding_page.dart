import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/font_config.dart';
import '../../constants/content/onboarding_contents.dart';
import 'onboarding_view_model.dart';
import 'onboarding_widget.dart';

class OnboardingPage extends ConsumerWidget with OnboardingWidget {
  final PageController _controller = PageController();

  OnboardingPage({super.key});

  List colors = const [
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
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        onboardingContents[index].title,
                        style: FontConfig.h1(),
                      ),
                      Text(
                        onboardingContents[index].desc,
                        style: FontConfig.p1(),
                      ),
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
