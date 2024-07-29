
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/app_logger_util.dart';
import 'package:movies_app/data/api/api_helper.dart';
import 'package:movies_app/sections/home_section/data/models/cast_response.dart';
import 'package:movies_app/sections/home_section/data/models/reviews_response.dart';

part 'get_movie_details_event.dart';

part 'get_movie_details_state.dart';

class GetMovieDetailsBloc
    extends Bloc<GetMovieDetailsEvent, GetMovieDetailsState> {
  GetMovieDetailsBloc() : super(const GetMovieDetailsState()) {
    on<GetReviewsEvent>(_getReviews);
    on<GetCastEvent>(_getCast);
  }

  Future<void> _getReviews(
    GetReviewsEvent event,
    Emitter<GetMovieDetailsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Reviews> reviews = [];
    try {
      final response = await ApiHelper.getClient().getReviews(event.id);
      if (response.totalPages != 0) {
        reviews = response.results ?? [];
        emit(
          state.copyWith(
            isLoading: false,
            reviews: reviews,
          ),
        );
      } else {
        emit(state.copyWith(isReviewsEmpty: true , isLoading: false));
      }
    }  catch (e) {
      AppLoggerUtil.e(e.toString());
    }
  }

  Future<void> _getCast(
    GetCastEvent event,
    Emitter<GetMovieDetailsState> emit,
  ) async {
    emit(state.copyWith(isCastLoading: true));
    List<Cast> cast = [];
    try {
      final response = await ApiHelper.getClient().getCast(event.id);
      if (response.cast != null) {
        cast = response.cast ?? [];
        emit(
          state.copyWith(
            isCastLoading: false,
            cast: cast,
          ),
        );
      }
    } catch (e) {
      AppLoggerUtil.e(e.toString());
    }
  }
}
