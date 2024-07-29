part of 'get_movie_details_bloc.dart';

class GetMovieDetailsState extends Equatable {
  const GetMovieDetailsState({
    this.isLoading = false,
    this.isCastEmpty = false,
    this.isReviewsEmpty = false,
    this.isCastLoading = false,
    this.reviews = const [],
    this.cast = const [],
  });

  final bool isLoading;
  final bool isCastLoading;
  final bool isCastEmpty;
  final bool isReviewsEmpty;
  final List<Reviews> reviews;
  final List<Cast> cast;

  GetMovieDetailsState copyWith({
    bool? isLoading,
    bool? isCastLoading,
    bool? isCastEmpty,
    bool? isReviewsEmpty,
    List<Reviews>? reviews,
    List<Cast>? cast,
  }) {
    return GetMovieDetailsState(
      isLoading: isLoading ?? this.isLoading,
      isCastLoading: isCastLoading ?? this.isCastLoading,
      isCastEmpty: isCastEmpty ?? this.isCastEmpty,
      isReviewsEmpty: isReviewsEmpty ?? this.isReviewsEmpty,
      reviews: reviews ?? this.reviews,
      cast: cast ?? this.cast,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isCastLoading,
        reviews,
        cast,
        isCastEmpty,
        isReviewsEmpty,
      ];
}
