import 'package:flutter/material.dart';
import 'package:fruits/features/splash/presentation/views/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SplashScreenBody()));
  }
}
