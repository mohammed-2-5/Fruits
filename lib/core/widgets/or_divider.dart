import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey, // Customize the color as needed
            indent: 10,         // Customize the indent as needed
            endIndent: 10,      // Customize the endIndent as needed
          ),
        ),
        Text(
          'أو', // Replace with your desired text
          style:AppTextStyles.style16w600
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey, // Customize the color as needed
            indent: 10,         // Customize the indent as needed
            endIndent: 10,      // Customize the endIndent as needed
          ),
        ),
      ],
    );
  }
}
