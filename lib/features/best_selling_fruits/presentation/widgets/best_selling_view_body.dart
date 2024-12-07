import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/widgets/best_selling_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [BestSellingGridView()],
    );
  }
}
