import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/utils/assets_paths.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline_rounded))),
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                AssetPaths.productTest,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 24,
              ),
              ListTile(
                title: Text('بطيخ',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.style13w600Black),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                          text: '20جنية ',
                          style: AppTextStyles.style13w700Grey.copyWith(
                            color: Color(0xFFF4A91F),
                          )),
                      TextSpan(
                          text: '/',
                          style: AppTextStyles.style13w700Grey.copyWith(
                            color: Color(0xFFF8C76D),
                          )),
                      TextSpan(
                          text: ' الكيلو',
                          style: AppTextStyles.style13w700Grey.copyWith(
                            color: Color(0xFFF8C76D),
                          )),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing: GestureDetector(
                  onTap: () {
                    // Define the action when button is pressed
                  },
                  child: CircleAvatar(
                    backgroundColor: AbstractAppColors
                        .primaryColor, // Green background color
                    child: const Icon(
                      Icons.add,
                      color: Colors.white, // White plus icon
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
