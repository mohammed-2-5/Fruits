import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/utils/assets_paths.dart';
import 'package:fruits/core/widgets/notification_widget.dart';

import '../../../../core/functions/get_user.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading:Image.asset(AssetPaths.avatar),
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: AppTextStyles.style16w400.copyWith(color: Color(0xFF949D9E))
      ),
      subtitle: Text(
          getData().name,
        textAlign: TextAlign.right,
        style: AppTextStyles.style16w700.copyWith(color:  Color(0xFF0C0D0D))
      ),
      trailing: NotificationWidget(),
    );
  }
}

