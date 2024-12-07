import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppBar({required String title,required BuildContext context}) {
  return AppBar(
    title: Text(title,
        textAlign: TextAlign.center, style: AppTextStyles.style19w700),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NotificationWidget(),
      )
    ],
    leading: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: OvalBorder(
            side: BorderSide(width: 3, color: Color(0xFFF1F1F5)),
          ),
        ),
        child: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 16,
        ),)
      ),
    ),
  );
}