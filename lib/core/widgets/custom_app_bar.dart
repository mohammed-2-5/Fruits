import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    toolbarHeight: 90,
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: AppTextStyles.style19w700,
    ),
  );
}
