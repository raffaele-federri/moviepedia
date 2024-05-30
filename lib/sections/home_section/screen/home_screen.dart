import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/widgets/now_playing.dart';
import 'package:movies_app/sections/home_section/widgets/popular.dart';
import 'package:movies_app/sections/home_section/widgets/top_rated.dart';
import 'package:movies_app/sections/home_section/widgets/upcoming.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int itemCount = 500;
    return BlocBuilder<CategoriesCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset('assets/icons/moviepedia.jpeg'),
                    Text('What do you want to watch ?',
                        style: AppTextStyles.white18w500),
                    AppUtils.kGap24,
                    SizedBox(
                      height: 220,
                      child: CarouselSlider.builder(
                        itemCount: 10,
                        itemBuilder: (context, index, realIndex) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius12,
                              color: Colors.amber,
                            ),
                            width: 160,
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 0.55,
                          enlargeCenterPage: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                      ),
                    ),
                    AppUtils.kGap24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        categoriesItem(state, "Now Playing", 0, context),
                        categoriesItem(state, "Upcoming", 1, context),
                        categoriesItem(state, "Top Rated", 2, context),
                        categoriesItem(state, "Popular", 3, context),
                      ],
                    ),
                    SizedBox(
                      height: itemCount * 87,
                      child: IndexedStack(
                        index: state,
                        children: const [
                          NowPlaying(itemCount: itemCount),
                          Upcoming(itemCount: itemCount),
                          TopRated(itemCount: itemCount),
                          Popular(itemCount: itemCount),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  GestureDetector categoriesItem(
      int state, String title, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CategoriesCubit>().changeTab(index);
      },
      child: Text(title,
          style: state == index
              ? AppTextStyles.blue14w400
              : AppTextStyles.white14w400),
    );
  }
}
