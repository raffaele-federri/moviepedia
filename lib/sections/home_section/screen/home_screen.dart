import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/carousel_widget.dart';
import 'package:movies_app/sections/home_section/widgets/categories_item.dart';

import '../../main_section/bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import '../../searching_section/screen/searching_screen.dart';

class HomeScreen extends StatelessWidget {
  final controller = ScrollController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesBloc, GetMoviesState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Visibility(
            visible: kDebugMode,
            child: FloatingActionButton(
              heroTag: UniqueKey(),
              onPressed: () {
                chuck.showInspector();
              },
            ),
          ),
          appBar: AppBar(
            backgroundColor: AppColors.scaffold,
            surfaceTintColor: AppColors.scaffold,
            toolbarHeight: 0,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'What do you want to watch ?',
                    style: AppTextStyles.white18w600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<BottomNavBarCubit>().changeTab(1);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: AppColors.indicatorGrey,
                      // Background color of the search bar
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    child: TextField(
                      enabled: false,
                      style: TextStyle(color: Colors.white), // Text color
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/nav_ic_2.svg',
                              height: 20,
                            ),
                          ],
                        ), // Search icon color
                      ),
                    ),
                  ),
                ),
                const CarouselSliderWidget(),
                AppUtils.kGap12,
                CategoriesItem(
                    title: 'Now Playing', results: state.nowPlaying, index: 0),
                CategoriesItem(
                    title: 'Upcoming', results: state.upcoming, index: 1),
                CategoriesItem(
                    title: 'Top rated', results: state.topRated, index: 2),
                CategoriesItem(
                    title: 'Popular', results: state.popular, index: 3),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         CategoriesItem(
//                             state: state, title: "Now Playing", index: 0),
//                         CategoriesItem(
//                             state: state, title: "Upcoming", index: 1),
//                         CategoriesItem(
//                             state: state, title: "Top Rated", index: 2),
//                         CategoriesItem(
//                             state: state, title: "Popular", index: 3),
//                       ],
//                     ),
//                     AppUtils.kGap24,
//                     IndexedStack(
//                       index: state,
//                       children: const [
//                         NowPlaying(),
//                         Upcoming(),
//                         TopRated(),
//                         Popular(),
//                       ],
//                     ),
