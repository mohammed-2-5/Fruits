import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    Key? key,
    required this.image,
    required this.backgroundImage,
    required this.title,
    required this.subTitle,
    required this.isVisible,
    required this.pageController,
  }) : super(key: key);

  final String image, backgroundImage;
  final Widget title;
  final String subTitle;
  final bool isVisible;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.53,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: SvgPicture.asset(
                      backgroundImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 25,
                    right: 0,
                    child: SvgPicture.asset(
                      image,
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            pageController.animateToPage(
                              pageController.positions.last.viewportDimension.round() - 1,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            'تخط',
                            style: AppTextStyles.style13w400Grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            title,
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.1,
                ),
                child: Text(
                  subTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style13w600Grey,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
