import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/screen/details_screen.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({super.key});

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  void initState() {
    context.read<GetMoviesBloc>().add(const GetTrendingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesBloc, GetMoviesState>(
      builder: (context, state) {
        final trending = state.trending;
        return state.sliderLoading
            ? const Center(
                child: AppUtils.kCenterLoading,
              )
            : SizedBox(
                height: 240,
                // color: Colors.red,
                child: CarouselSlider.builder(
                  itemCount: trending.length,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: BlocProvider.of<GetMoviesBloc>(context),
                              child: BlocProvider(
                                create: (context) => GetMovieDetailsBloc()..add(GetReviewsEvent(trending[index].id ?? 0))
                                  ..add(GetCastEvent(trending[index].id ?? 0)),
                                child: const DetailsScreen(),
                              ),
                            ),
                          ),
                        );
                        context.read<GetMoviesBloc>().add(GetDetailsByIdEvent(
                            id: trending[index].id ?? 0));
                      },
                      child: ClipRRect(
                        borderRadius: AppUtils.kBorderRadius12,
                        child: SizedBox(
                          width: 170,
                          child: Image.network(
                            fit: BoxFit.cover,
                            "https://image.tmdb.org/t/p/w500${trending[index].posterPath ?? ''}",
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 15 / 9,
                    autoPlay: true,
                    viewportFraction: 0.48,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 4),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                ),
              );
      },
    );
  }
}
