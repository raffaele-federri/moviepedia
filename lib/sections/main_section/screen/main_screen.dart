import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/screen/home_screen.dart';
import 'package:movies_app/sections/main_section/bloc/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:movies_app/sections/searching_section/screen/searching_screen.dart';
import 'package:movies_app/sections/watchlist_section/screen/watchlist_screen.dart';

import '../../../core/themes/app_colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarCubit(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => GetMoviesBloc(),
        ),BlocProvider(
          create: (context) => GetMovieDetailsBloc(),
        ),
      ],
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.bottomNavItemSelected,
                    // Change color as needed
                    width: 1, // Change thickness as needed
                  ),
                ),
                color: Colors.transparent,
              ),
              height: 78,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    bottomTabItem(state, 'Home', 0, context),
                    bottomTabItem(state, 'Search', 1, context),
                    bottomTabItem(state, 'Watch list', 2, context),
                  ],
                ),
              ),
            ),
            body: IndexedStack(
              index: state,
              children: const [
                HomeScreen(),
                SearchingScreen(),
                WatchlistScreen(),
              ],
            ),
          );
        },
      ),
    );
  }

  GestureDetector bottomTabItem(
      int state, String title, int index, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<BottomNavBarCubit>().changeTab(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/nav_ic_${index + 1}.svg',
            colorFilter: ColorFilter.mode(
              state == index
                  ? AppColors.bottomNavItemSelected
                  : AppColors.bottomNavItemUnselected,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: state == index
                  ? AppColors.bottomNavItemSelected
                  : AppColors.bottomNavItemUnselected,
            ),
          ),
        ],
      ),
    );
  }
}
