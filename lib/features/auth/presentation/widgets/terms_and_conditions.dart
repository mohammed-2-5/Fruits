import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_colors.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({Key? key, required this.onChecked}) : super(key: key);
  final ValueChanged<bool> onChecked;
  @override
  _TermsAndConditionsState createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,// Align the content to the right
      children: [
        Transform.scale(
          scale: 1.4,
          alignment: Alignment.bottomLeft,
          child: Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.padded, // Reduce the size of the Checkbox
            visualDensity: VisualDensity.standard, // Make the checkbox and its checkmark smaller
            checkColor: Colors.white, // Color of the checkmark
            side: BorderSide(width: 1.5, color: Color(0xFFDDDFDF)),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFFDDDFDF)),
              borderRadius: BorderRadius.circular(6),

            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
                widget.onChecked(isChecked);
              });
            },
          ),
        ),
        Expanded(
          child: RichText(
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,// Set the text direction to RTL
            text: TextSpan(
              text: 'من خلال إنشاء حساب، فإنك توافق على ',
              style:  AppTextStyles.style13w600Grey.copyWith(color: Color(0xFF949D9E),wordSpacing: 3),
              children: [
                TextSpan(
                  text: 'الشروط و الأحكام و الخاصة بنا',
                  style: AppTextStyles.style13w600Grey.copyWith( color: AbstractAppColors.secondaryColor,wordSpacing: 3),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                    },
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}