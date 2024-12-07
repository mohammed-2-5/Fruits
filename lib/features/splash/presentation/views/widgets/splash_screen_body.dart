import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/services/firebase_auth_services.dart';
import 'package:fruits/core/services/shared_preference.dart';
import 'package:fruits/core/utils/assets_paths.dart';
import 'package:fruits/features/OnBoarding/presentation/views/on_boarding_screen.dart';
import 'package:fruits/features/auth/presentation/views/login_screen.dart';
import 'package:fruits/features/home/presentation/views/home_view.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  _SplashScreenBodyState createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward();

  late final Animation<double> _opacityAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  @override
  void initState() {
    super.initState();
    // Navigate to OnBoardingScreen after 3 seconds
    Future.delayed(const Duration(seconds: 2), () {
     bool isViewed= SharedPreferencesSingleton.getBool('checkOnBoarding') ??false;
      if(isViewed) {
        var isLogged=FirebaseAuthService().isLoggedIn();
        if(isLogged){
          Navigator.of(context).pushReplacementNamed(HomeView.routeName);

        }else{
          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

        }
      }else {
        Navigator.of(context).pushReplacementNamed(OnBoardingScreen.routeName);

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: SvgPicture.asset(AssetPaths.plantIcon),
        ),
        FadeTransition(
          opacity: _opacityAnimation,
          child: SvgPicture.asset(AssetPaths.splash),
        ),
        SvgPicture.asset(
          AssetPaths.circlesIcon,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
