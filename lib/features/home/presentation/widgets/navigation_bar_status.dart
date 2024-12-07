import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/widgets/active_item.dart';
import 'package:fruits/features/home/presentation/widgets/in_active_item.dart';

import '../../domain/entities/bottom_nac_bar_entity.dart';

class NavigationBarStatus extends StatelessWidget {
  const NavigationBarStatus({Key? key, required this.isSelected,  required this.entity}) : super(key: key);

  final bool isSelected ;

final  BottomNavBarEntity entity;
  @override
  Widget build(BuildContext context) {
    return isSelected?ActiveItem(iconPath: entity.activeImage,name: entity.name,):InActiveItem(iconPath: entity.inActiveImage);
  }
}
