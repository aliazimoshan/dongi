import 'package:flutter/material.dart';
import 'package:dongi/views/components/button/bordered_button.dart';
import 'package:dongi/views/components/button/normal_button.dart';
import 'package:dongi/views/constants/onboarding_contents.dart';

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
        contents.length,
        (int index) => dot(index, currentPage),
      ),
    );
  }

  actionButtons(int index, PageController controller) {
    return index + 1 == contents.length
        ? Row(
            children: [
              Expanded(
                child: NormalButton(
                  title: "START",
                  onPressed: () {},
                ),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(
                flex: 2,
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
