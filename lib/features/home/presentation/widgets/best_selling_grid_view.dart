import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/fruit_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 8,

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 163/214,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return FruitItem();
        },);
  }
}
