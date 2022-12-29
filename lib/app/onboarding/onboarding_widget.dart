import 'package:dongi/widgets/button/button.dart';
import 'package:flutter/material.dart';
import '../../constants/content/onboarding_contents.dart';

class OnboardingWidget {
  animatedDots(int index, int currentPage) {
    AnimatedContainer dot(int index, int currentPage) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          color: currentPage == index ? Colors.black : Colors.grey.shade300,
        ),
        margin: const EdgeInsets.only(right: 5),
        height: 10,
        curve: Curves.easeIn,
        width: currentPage == index ? 20 : 10,
      );
    }

    return Row(
      children: List.generate(
        onboardingContents.length,
        (int index) => dot(index, currentPage),
      ),
    );
  }

  actionButtons(BuildContext context, int index, PageController controller) {
    return Row(
      children: index + 1 == onboardingContents.length
          ? [
              Expanded(
                child: ButtonWidget(
                  title: "START",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    );
                  },
                ),
              ),
            ]
          : [
              SizedBox(
                width: 50,
                child: ButtonWidget.outline(
                  title: "SKIP",
                  onPressed: () {
                    controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: ButtonWidget(
                  title: "NEXT",
                  textColor: Colors.white,
                  onPressed: () {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn,
                    );
                  },
                  backgroundColor: null,
                ),
              ),
            ],
    );
  }
}
