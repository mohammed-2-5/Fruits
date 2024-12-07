import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/utils/assets_paths.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth,
      child: AspectRatio(
        aspectRatio: 342 / 152,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                right: itemWidth * .4,
                child: Image.asset(
                  AssetPaths.productTest,
                  fit: BoxFit.fill,
                )),
            Container(
              width: itemWidth * 0.5,
              height: 158,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AssetPaths.backgroundProductItem))),
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Opacity(
                      opacity: 0.80,
                      child: Text(
                        'عروض العيد',
                        style: AppTextStyles.style13w400Grey
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'خصم 25%',
                      style: AppTextStyles.style19w700
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Spacer(),
                    SizedBox(
                      height: 32,
                      width: 132,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.green,
                          backgroundColor: Colors.white, // Button text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: FittedBox(
                          child: Text('تسوق الان',
                              style: AppTextStyles.style13w700Grey
                                  .copyWith(color: Color(0xFF1B5E37))),
                        ),
                      ),
                    ),
                    SizedBox(height: 29),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
