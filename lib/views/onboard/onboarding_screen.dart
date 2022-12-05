import 'package:flutter/material.dart';
import 'package:testingriverpod/views/components/button/bordered_button.dart';
import 'package:testingriverpod/views/components/button/normal_button.dart';
import 'package:testingriverpod/views/constants/onboarding_contents.dart';
import 'package:testingriverpod/views/constants/size_config.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index ? Colors.black : Colors.grey.shade300,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        onPageChanged: (value) => setState(() => _currentPage = value),
        itemCount: contents.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      contents[i].image,
                      height: SizeConfig.blockV! * 35,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        contents[i].title,
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          fontSize: (width <= 550) ? 30 : 35,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        contents[i].desc,
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w300,
                          fontSize: (width <= 550) ? 17 : 25,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          contents.length,
                          (int index) => _buildDots(
                            index: index,
                          ),
                        ),
                      ),
                      i + 1 == contents.length
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
                                      _controller.animateToPage(
                                        2,
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: NormalButton(
                                    title: "NEXT",
                                    onPressed: () {
                                      _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                      );
                                    },
                                    backgroundColor: null,
                                  ),
                                ),
                              ],
                            )
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
