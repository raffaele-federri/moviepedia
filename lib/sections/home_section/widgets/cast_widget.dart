import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/text_styles/app_text_styles.dart';
import 'package:movies_app/core/themes/app_colors.dart';
import 'package:movies_app/core/utils/app_utils.dart';
import 'package:movies_app/sections/home_section/bloc/get_movie_details_bloc/get_movie_details_bloc.dart';
import 'package:movies_app/sections/home_section/widgets/shimmers/cast_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMovieDetailsBloc, GetMovieDetailsState>(
      builder: (context, state) {
        final cast = state.cast;
        return state.isCastLoading
            ? const CastShimmer()
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.cast.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: AppColors.scaffold,
                          foregroundImage: cast[index].profilePath != null
                              ? NetworkImage(
                                  "https://image.tmdb.org/t/p/w500${cast[index].profilePath}")
                              : const NetworkImage(
                                  'https://m.media-amazon.com/images/I/61EGr1YYRCL._AC_UF1000,1000_QL80_DpWeblab_.jpg',
                                ),
                        ),
                        AppUtils.kGap12,
                        Text(
                          cast[index].originalName ?? 'Unknown',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.white12w500,
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
