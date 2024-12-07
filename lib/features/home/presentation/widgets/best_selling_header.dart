import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/features/best_selling_fruits/presentation/pages/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          textAlign: TextAlign.right,
          style: AppTextStyles.style16w700,
          ),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            'المزيد',
            textAlign: TextAlign.center,
            style: AppTextStyles.style13w400Grey
          ),
        )
      ],
    );
  }
}
