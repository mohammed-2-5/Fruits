import 'package:flutter/material.dart';
import 'package:fruits/features/OnBoarding/presentation/views/widgets/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static const routeName = "on_boarding_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OnBoardingScreenBody(),
    );
  }
}
