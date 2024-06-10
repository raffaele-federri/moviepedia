import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';

class CategoriesItem extends StatelessWidget {
  final String title;
  final int index;
  final int? movieId;
  final int state;
  final bool? category;

  const CategoriesItem({
    super.key,
    required this.title,
    required this.index,
    required this.state,
    this.category = true,
    this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        category!
            ? context.read<CategoriesCubit>().changeTab(index)
            : context.read<CategoriesCubit>().changeTab(index);
        if (index == 1 && movieId != 0 && category == false) {
          context.read<GetMovieDetailsBloc>().add(
                GetReviewsEvent(movieId ?? 0),
              );
        } else if (index == 2 && movieId != 0 && category == false) {
          context.read<GetMovieDetailsBloc>().add(
                GetCastEvent(movieId ?? 1),
              );
        }
      },
      child: Text(title,
          style: state == index
              ? AppTextStyles.blue14w500
              : AppTextStyles.white14w500),
    );
    ;
  }
}
