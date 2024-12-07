import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/build_app_bar.dart';
import 'package:fruits/features/best_selling_fruits/presentation/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({Key? key}) : super(key: key);

  static const routeName = "best_selling_view";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'الأكثر مبيعًا',context: context),
      body: BestSellingViewBody(),
    );
  }


}
