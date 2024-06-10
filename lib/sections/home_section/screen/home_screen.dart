import 'package:carousel_slider/carousel_slider.dart';
import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/widgets/carousel_widget.dart';
import 'package:movies_app/sections/home_section/widgets/categories_item.dart';
import 'package:movies_app/sections/home_section/widgets/now_playing.dart';
import 'package:movies_app/sections/home_section/widgets/popular.dart';
import 'package:movies_app/sections/home_section/widgets/top_rated.dart';
import 'package:movies_app/sections/home_section/widgets/upcoming.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, int>(
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
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image.asset('assets/icons/moviepedia.jpeg'),
                    Text('What do you want to watch ?',
                        style: AppTextStyles.white18w600),
                    AppUtils.kGap24,
                    const CarouselSliderWidget(),
                    AppUtils.kGap24,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoriesItem(
                            state: state, title: "Now Playing", index: 0),
                        CategoriesItem(
                            state: state, title: "Upcoming", index: 1),
                        CategoriesItem(
                            state: state, title: "Top Rated", index: 2),
                        CategoriesItem(
                            state: state, title: "Popular", index: 3),
                      ],
                    ),
                    AppUtils.kGap24,
                    IndexedStack(
                      index: state,
                      children: const [
                        NowPlaying(),
                        Upcoming(),
                        TopRated(),
                        Popular(),
                      ],
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

// GestureDetector categoriesItem(
//     int state, String title, int index, BuildContext context) {
//   return GestureDetector(
//     onTap: () {
//       context.read<CategoriesCubit>().changeTab(index);
//     },
//     child: Text(title,
//         style: state == index
//             ? AppTextStyles.blue14w400
//             : AppTextStyles.white14w400),
//   );
// }
}
