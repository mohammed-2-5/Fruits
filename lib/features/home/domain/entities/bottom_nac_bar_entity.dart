import 'package:fruits/core/utils/assets_paths.dart';

class BottomNavBarEntity {
  final String activeImage, inActiveImage,name;

  BottomNavBarEntity({required this.activeImage, required this.inActiveImage, required this.name});



}
List<BottomNavBarEntity> get bottomNavBarList => [
  BottomNavBarEntity(
      activeImage: AssetPaths.homeActiveIcon,
      inActiveImage: AssetPaths.homeInactiveIcon,
      name: "الرئيسية" ),

  BottomNavBarEntity(
      activeImage: AssetPaths.categoryActiveIcon,
      inActiveImage: AssetPaths.categoryInactiveIcon,
      name: "المنتجات" ),

  BottomNavBarEntity(
      activeImage: AssetPaths.shoppingCartActiveIcon,
      inActiveImage: AssetPaths.shoppingCartInactiveIcon,
      name: "عربة التسوق" ),

  BottomNavBarEntity(
      activeImage: AssetPaths.userActiveIcon,
      inActiveImage: AssetPaths.userInactiveIcon,
      name: "حسابي" ),

];