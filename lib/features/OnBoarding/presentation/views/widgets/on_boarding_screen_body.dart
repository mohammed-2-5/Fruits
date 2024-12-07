import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/services/shared_preference.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/features/auth/presentation/views/login_screen.dart';

import 'on_boarding_page_view.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  late PageController pageController;

  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(pageController: pageController,)),
        DotsIndicator(
        dotsCount: 2,
          position: currentPage,
          reversed: true,
          decorator: DotsDecorator(
            activeColor: Color(0xff1B5E37),
            color:currentPage==0? Color(0xff5DB957): Color(0xff1B5E37),
          ),
        ),
        SizedBox(height: 29,),

        Visibility(
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          visible: currentPage==1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(onPressed: () {
              SharedPreferencesSingleton.setBool('checkOnBoarding', true);
              print(SharedPreferencesSingleton.getBool('checkOnBoarding'));
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            }, title: 'ابدأ الان'),
          ),
        ),
        SizedBox(height: 43,)
      ],
    );
  }
}
