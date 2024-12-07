import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({Key? key, required this.iconPath, required this.name})
      : super(key: key);
  final String iconPath;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: ShapeDecoration(
          color: Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                  color: Color(0xFF1B5E37),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                child: Center(
                    child: SvgPicture.asset(
                  iconPath,
                ))),
            SizedBox(
              width: 4,
            ),
            Text(name, style: AppTextStyles.style11w600Green),
          ],
        ),
      ),
    );
  }
}
