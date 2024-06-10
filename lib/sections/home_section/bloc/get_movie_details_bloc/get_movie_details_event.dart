part of 'get_movie_details_bloc.dart';

sealed class GetMovieDetailsEvent extends Equatable {
  const GetMovieDetailsEvent();
}

class GetReviewsEvent extends GetMovieDetailsEvent {
  final int id;
  const GetReviewsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetCastEvent extends GetMovieDetailsEvent {
  final int id;

  const GetCastEvent(this.id);

  @override
  List<Object?> get props => [id];
}
