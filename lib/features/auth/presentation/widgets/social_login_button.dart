import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String assetName;
  final VoidCallback onPressed;

  const SocialLoginButton({
    Key? key,
    required this.text,
    required this.assetName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(

          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(16),
          ),
          side: const BorderSide(color: Color(0xffDDDFDF)),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(assetName,height: 24,width: 24),
          title: Text(text,style: AppTextStyles.style16w600,textAlign: TextAlign.center,),
        )
      ),
    );
  }
}