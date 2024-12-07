import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits/core/functions/on_generate_routes.dart';
import 'package:fruits/core/services/custom_bloc_observer.dart';
import 'package:fruits/core/services/shared_preference.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'core/services/get_it_services.dart';
import 'generated/l10n.dart';

import 'features/splash/presentation/views/splash_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize the SharedPreferencesSingleton
  await SharedPreferencesSingleton.init();
  print(SharedPreferencesSingleton.getBool('checkOnBoarding'));
  setupGetIt();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: AbstractAppColors.white,
          appBarTheme: AppBarTheme(color: AbstractAppColors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: AbstractAppColors.primaryColor)

      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('ar'),
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
     onGenerateRoute: onGenerateRoutes,
      initialRoute: SplashScreen.routeName,
    );
  }
}

