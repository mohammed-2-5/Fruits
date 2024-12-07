import 'package:flutter/material.dart';
import 'featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return AspectRatio(
     aspectRatio: 375 / 158, // Adjust height based on screen width
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 8),
        separatorBuilder: (context, index) => SizedBox(width: 5),
        itemBuilder: (context, index) {
          return SizedBox(
            width: screenWidth * 0.88, // Adjust width for each item
            child: FeaturedItem(),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
