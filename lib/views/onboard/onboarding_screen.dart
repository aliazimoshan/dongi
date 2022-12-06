import 'package:flutter/material.dart';
import 'package:dongi/views/components/button/bordered_button.dart';
import 'package:dongi/views/components/button/normal_button.dart';
import 'package:dongi/views/constants/onboarding_contents.dart';
import 'package:dongi/views/constants/size_config.dart';
import 'package:dongi/views/onboard/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with OnboardingWidget {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _controller,
        onPageChanged: (value) => setState(() => _currentPage = value),
        itemCount: contents.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      contents[index].image,
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
                        contents[index].title,
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          fontSize: (width <= 550) ? 30 : 35,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        contents[index].desc,
                        style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w300,
                          fontSize: (width <= 550) ? 17 : 25,
                          color: Colors.black,
                        ),
                      ),
                      animatedDots(index, _currentPage),
                      actionButtons(index, _controller)
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
