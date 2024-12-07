import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class SignUpPrompt extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onActionTap;

  const SignUpPrompt({
    Key? key,
    required this.questionText,
    required this.actionText,
    required this.onActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: questionText,
              style: AppTextStyles.style16w600.copyWith(color: const Color(0xff949D9E)),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onActionTap,
              text: actionText,
              style: AppTextStyles.style16w600.copyWith(color: AbstractAppColors.primaryColor),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
