import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/main.dart';
import 'package:movies_app/sections/home_section/bloc/categories_cubit/categories_cubit.dart';
import 'package:movies_app/sections/home_section/bloc/get_movies_bloc/get_movies_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/cast_widget.dart';
import 'package:movies_app/sections/home_section/widgets/categories_item.dart';
import 'package:movies_app/sections/home_section/widgets/reviews_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviesBloc, GetMoviesState>(
      builder: (context, state) {
        final details = state.details;
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
            backgroundColor: Colors.transparent,
          ),
          body: state.detailsLoading
              ? AppUtils.kCenterLoading
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 280,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomStart,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: AppUtils.kRadius12,
                                  bottomRight: AppUtils.kRadius12,
                                ),
                                child: SizedBox(
                                  height: 210,
                                  width: double.infinity,
                                  child: Image.network(
                                    fit: BoxFit.cover,
                                    "https://image.tmdb.org/t/p/w500${details?.backdropPath ?? ''}",
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ClipRRect(
                                    borderRadius: AppUtils.kBorderRadius12,
                                    child: Container(
                                      height: 130,
                                      width: 105,
                                      color: Colors.red,
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        "https://image.tmdb.org/t/p/w500${details?.posterPath ?? ''}",
                                      ),
                                    ),
                                  ),
                                  AppUtils.kGap12,
                                  SizedBox(
                                    width: 240,
                                    height: 60,
                                    child: Text(
                                      details?.title ?? '',
                                      style: AppTextStyles.white18w600,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppUtils.kGap16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/calendar.svg'),
                          AppUtils.kGap4,
                          Text(details?.releaseDate?.split('-').first ?? '',
                              style: AppTextStyles.grey12w400),
                          AppUtils.kGap12,
                          Container(
                              width: 1, height: 16, color: AppColors.textGrey),
                          AppUtils.kGap12,
                          SvgPicture.asset('assets/icons/clock.svg'),
                          AppUtils.kGap4,
                          Text("${details?.runtime.toString() ?? ''} Minutes",
                              style: AppTextStyles.grey12w400),
                          AppUtils.kGap12,
                          Container(
                              width: 1, height: 16, color: AppColors.textGrey),
                          AppUtils.kGap12,
                          SvgPicture.asset('assets/icons/ticket.svg'),
                          AppUtils.kGap4,
                          Text(details?.genres?.first.name ?? '',
                              style: AppTextStyles.grey12w400),
                        ],
                      ),
                      AppUtils.kGap24,
                      BlocProvider(
                        create: (context) => CategoriesCubit(),
                        child: BlocBuilder<CategoriesCubit, int>(
                          builder: (context, state) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CategoriesItem(
                                        state: state,
                                        title: "About Movie",
                                        index: 0,
                                        category: false,
                                      ),
                                      AppUtils.kGap24,
                                      CategoriesItem(
                                        state: state,
                                        title: "Reviews",
                                        index: 1,
                                        movieId: details?.id ?? 0,
                                        category: false,
                                      ),
                                      AppUtils.kGap24,
                                      CategoriesItem(
                                        state: state,
                                        title: "Cast",
                                        index: 2,
                                        movieId: details?.id ?? 0,
                                        category: false,
                                      ),
                                    ],
                                  ),
                                  AppUtils.kGap24,
                                  IndexedStack(
                                    index: state,
                                    children: [
                                      Text(
                                        details?.overview ?? '',
                                        style: AppTextStyles.white14w500,
                                      ),
                                      const ReviewsWidget(),
                                      const CastWidget(),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
