import 'package:flutter/material.dart';
import 'package:fruits/features/OnBoarding/presentation/views/on_boarding_screen.dart';
import 'package:fruits/features/auth/presentation/views/login_screen.dart';
import 'package:fruits/features/auth/presentation/views/sign_up_screen.dart';
import 'package:fruits/features/best_selling_fruits/presentation/pages/best_selling_view.dart';
import 'package:fruits/features/home/presentation/views/home_view.dart';
import 'package:fruits/features/splash/presentation/views/splash_screen.dart';


Route<dynamic> onGenerateRoutes(RouteSettings settings)
{
  switch (settings.name)
      {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen(),);
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen(),);

    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen(),);

    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpScreen(),);

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView(),);


    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView(),);
    default:
      return MaterialPageRoute(builder: (context) =>Scaffold());

  }
}