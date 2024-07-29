import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/data/models/now_playing_response.dart';
import 'package:movies_app/sections/home_section/screen/details_screen.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({
    super.key,
    required this.itemCount,
    required this.results,
    required this.id,
    this.controller,
  });

  final int id;
  final int itemCount;
  final List<Results> results;
  final ScrollController? controller;

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  final _controller = ScrollController();

  @override
  void initState() {
    widget.controller?.addListener(() {
      setState(() {});
      print("widget.controller?.offset");
      print(widget.controller?.offset);
    });
    _controller.addListener(() {
      print(widget.controller?.position.maxScrollExtent);
      print(widget.controller?.offset);
      if (_controller.position.maxScrollExtent == _controller.offset) {
        switch (widget.id) {
          case 0:
            context.read<GetMoviesBloc>().add(const GetMoreNowPlayingEvent());
            break;
          case 1:
            context.read<GetMoviesBloc>().add(const GetMoreUpcomingEvent());
            break;
          case 2:
            context.read<GetMoviesBloc>().add(const GetMoreTopRatedEvent());
            break;
          case 3:
            context.read<GetMoviesBloc>().add(const GetMorePopularEvent());
            break;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return GridView.builder(
      physics: widget.controller?.position.maxScrollExtent ==
              widget.controller?.offset
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: widget.itemCount + 2,
      controller: _controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 13,
        mainAxisSpacing: 20,
        mainAxisExtent: 230,
      ),
      itemBuilder: (context, index) {
        return index < widget.itemCount
            ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<GetMoviesBloc>(context),
                        child: BlocProvider(
                            create: (context) => GetMovieDetailsBloc()
                              ..add(GetReviewsEvent(
                                  widget.results[index].id ?? 0))
                              ..add(
                                  GetCastEvent(widget.results[index].id ?? 0)),
                            child: const DetailsScreen()),
                      ),
                    ),
                  );
                  context.read<GetMoviesBloc>().add(
                      GetDetailsByIdEvent(id: widget.results[index].id ?? 0));
                },
                child: ClipRRect(
                  borderRadius: AppUtils.kBorderRadius12,
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover,
                    width: double.infinity,
                    fadeOutDuration: Duration(milliseconds: 10),   // Duration of the fade-out animation
                    fadeInDuration: Duration(milliseconds: 600),    // Duration of the fade-in animation
                    fadeOutCurve: Curves.easeIn,  // Curve for fading out the placeholder
                    fadeInCurve: Curves.easeOut,
                    placeholder: 'assets/images/initial_poster.jpg',
                    image:
                        "https://image.tmdb.org/t/p/w500${widget.results[index].posterPath ?? ''}",
                  ),
                ),
              )
            : Shimmer.fromColors(
                baseColor: AppColors.shimmerBase,
                highlightColor: AppColors.shimmerHighlight,
                child: ClipRRect(
                  borderRadius: AppUtils.kBorderRadius12,
                  child: Container(
                    height: 10,
                    width: 10,
                    color: AppColors.shimmerBase,
                  ),
                ),
              );
      },
    );
  }
}
