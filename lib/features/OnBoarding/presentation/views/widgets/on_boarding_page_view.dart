import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/utils/assets_paths.dart';
import 'package:fruits/features/OnBoarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
              pageController: pageController,

              isVisible: true ,
              image: AssetPaths.fruitBasketAmico,
              backgroundImage: AssetPaths.pageViewBackGround1,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('مرحباً بك في', style: AppTextStyles.style23w700),
                  const SizedBox(width: 5),
                  Text('HUB',
                      style: AppTextStyles.style23w700
                          .copyWith(color: Colors.orange[500])),
                  Text('Fruit',
                      style: AppTextStyles.style23w700
                          .copyWith(color: Color(0xff1B5E37))),
                ],
              ),
              subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.'),
          PageViewItem(
            pageController: pageController,
            isVisible: false,
              image: AssetPaths.pineappleCuate,
              backgroundImage: AssetPaths.pageViewBackGround2,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ابحث وتسوق', style: AppTextStyles.style23w700),
                ],
              ),
              subTitle:
                  'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية'),

        ],
      ),
    );
  }
}
