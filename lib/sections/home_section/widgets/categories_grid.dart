import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/data/models/now_playing_response.dart';
import 'package:movies_app/sections/home_section/screen/details_screen.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid(
      {super.key, required this.itemCount, required this.results});

  final int itemCount;
  final List<Results> results;


  @override
  Widget build(context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 20,
        mainAxisExtent: 230,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<GetMoviesBloc>(context),

                  child: BlocProvider(
                     create: (context) => GetMovieDetailsBloc(),
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
        );
      },
    );
  }
}
