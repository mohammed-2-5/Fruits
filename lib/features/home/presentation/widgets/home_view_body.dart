import 'package:flutter/material.dart';
import 'package:fruits/features/home/presentation/widgets/best_selling_grid_view.dart';
import 'package:fruits/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruits/features/home/presentation/widgets/custom_home_appbar.dart';
import 'package:fruits/features/home/presentation/widgets/custom_home_search_bar.dart';
import 'package:fruits/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
             child: Column(
               children: [
                 CustomHomeAppbar(),
                 SizedBox(height: 16,),
                 CustomHomeSearchBar(),
                 SizedBox(height: 12,),
                 FeaturedList(),
                 SizedBox(height: 12,),
                 BestSellingHeader(),
                 SizedBox(height: 8,),
               ],
             ),
            ),
            BestSellingGridView()

          ],
        ),
      ),
    );
  }
}
