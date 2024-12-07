import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/utils/assets_paths.dart';

class CustomHomeSearchBar extends StatelessWidget {
  const CustomHomeSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 48,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        shadows: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child:  TextField(
        keyboardType: TextInputType.text,

        decoration: InputDecoration(
          prefixIcon: SizedBox(
              width: 20,
              child: Center(child: SvgPicture.asset(AssetPaths.search))),
          //prefixIconConstraints: BoxConstraints.tight(Size(20, 20)),
          border: InputBorder.none,
          hintText: 'ابحث عن.......',
          hintStyle: AppTextStyles.style13w400Grey,
          suffixIcon: SizedBox(
              width: 20,
              child: Center(child: SvgPicture.asset(AssetPaths.setting))),
          //suffixIconConstraints: BoxConstraints.tight(Size(20, 20)),
        ),
      ),
    );
  }
}
