import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/themes/custom_shape.dart';
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
      ],
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: Container(
              color: Colors.cyan,
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
              state == index ? AppColors.white : AppColors.scaffold,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: state == index ? AppColors.white : AppColors.scaffold,
            ),
          ),
        ],
      ),
    );
  }
}
