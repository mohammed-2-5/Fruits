import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:fruits/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
static const routeName = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: HomeViewBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
