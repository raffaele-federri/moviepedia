import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/shimmers/review_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieDetailsBloc, GetMovieDetailsState>(
      builder: (context, state) {
        return
            state.isLoading
            ? const ReviewShimmer()
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.textGrey,
                              radius: 22,
                              foregroundImage: NetworkImage(
                                'https://image.tmdb.org/t/p/w500${state.reviews[index].authorDetails?.avatarPath}',
                              ),
                              backgroundImage: const NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/256/4440/4440953.png'),
                            ),
                            AppUtils.kGap15,
                            Text(
                              state.reviews[index].authorDetails?.rating
                                      .toString() ??
                                  '',
                              style: AppTextStyles.blue14w500,
                            )
                          ],
                        ),
                        AppUtils.kGap24,
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                state.reviews[index].content ?? '',
                                style: AppTextStyles.white14w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
