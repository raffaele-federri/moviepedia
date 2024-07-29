import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/data/models/now_playing_response.dart';
import 'package:movies_app/sections/home_section/screen/details_screen.dart';
import 'package:movies_app/sections/home_section/widgets/now_playing.dart';
import 'package:movies_app/sections/home_section/widgets/popular.dart';
import 'package:movies_app/sections/home_section/widgets/top_rated.dart';
import 'package:movies_app/sections/home_section/widgets/upcoming.dart';

import '../bloc/get_movies_bloc/get_movies_bloc.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final int index;
  final List<Results> results;

  const CategoriesItem({
    super.key,
    required this.title,
    required this.index,
    required this.results,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppUtils.kGap12,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Text(
                title,
                style: AppTextStyles.white18w600,
              ),
              AppUtils.kSpacer,
              InkWell(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<GetMoviesBloc>(context),
                            child: const NowPlaying(),
                          ),
                        ),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<GetMoviesBloc>(context),
                            child: const Upcoming(),
                          ),
                        ),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<GetMoviesBloc>(context),
                            child: const TopRated(),
                          ),
                        ),
                      );
                      break;
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: BlocProvider.of<GetMoviesBloc>(context),
                            child: const Popular(),
                          ),
                        ),
                      );
                      break;
                  }
                },
                child: Text(
                  'See all',
                  style: AppTextStyles.blue14w500,
                ),
              ),
            ],
          ),
        ),
        AppUtils.kGap12,
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            itemCount: results.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: BlocProvider.of<GetMoviesBloc>(context),
                          child: BlocProvider(
                              create: (context) => GetMovieDetailsBloc()
                                ..add(GetReviewsEvent(results[index].id ?? 0))
                                ..add(GetCastEvent(results[index].id ?? 0)),
                              child: const DetailsScreen()),
                        ),
                      ),
                    );
                    context
                        .read<GetMoviesBloc>()
                        .add(GetDetailsByIdEvent(id: results[index].id ?? 0));
                  },
                  child: ClipRRect(
                    borderRadius: AppUtils.kBorderRadius12,
                    child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      "https://image.tmdb.org/t/p/w500${results[index].posterPath ?? ''}",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
