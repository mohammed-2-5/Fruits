import 'package:flutter/material.dart';


import '../../domain/entities/bottom_nac_bar_entity.dart';
import 'navigation_bar_status.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child:Row(
        children: bottomNavBarList.asMap().entries.map((e) {

          var index=e.key;
          var entity=e.value;
              return Expanded(
                flex: isSelected==index?3:2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected = index;
                    });
                  },
                  child: NavigationBarStatus(
                    entity: entity,
                    isSelected: isSelected==index,
                  ),
                ),
              );
            }
        ).toList(),
      )
    );
  }
}
