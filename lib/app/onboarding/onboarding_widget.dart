import 'package:flutter/material.dart';
import '../../constants/onboarding_contents.dart';
import '../../widgets/button/bordered_button.dart';
import '../../widgets/button/normal_button.dart';

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
    return index + 1 == onboardingContents.length
        ? Row(
            children: [
              Expanded(
                child: NormalButton(
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
            ],
          )
        : Row(
            children: [
              Expanded(
                child: BorderedButton(
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
              const SizedBox(width: 20),
              Expanded(
                flex: 3,
                child: NormalButton(
                  title: "NEXT",
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
