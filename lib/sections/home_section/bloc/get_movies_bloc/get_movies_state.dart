part of 'get_movies_bloc.dart';

class GetMoviesState extends Equatable {
  const GetMoviesState({
    this.isLoading = false,
    this.sliderLoading = false,
    this.detailsLoading = false,
    this.isInitialLoading = false,
    this.nowPlaying = const [],
    this.popular = const [],
    this.topRated = const [],
    this.upcoming = const [],
    this.trending = const [],
    this.details,
  });

  final bool isLoading;
  final bool sliderLoading;
  final bool detailsLoading;
  final bool isInitialLoading;
  final List<Results> nowPlaying;
  final List<Results> popular;
  final List<Results> topRated;
  final List<Results> upcoming;
  final List<Results> trending;
  final DetailsResponse? details;

  GetMoviesState copyWith({
    bool? isLoading,
    bool? sliderLoading,
    bool? detailsLoading,
    bool? isInitialLoading,
    List<Results>? nowPlaying,
    List<Results>? popular,
    List<Results>? topRated,
    List<Results>? upcoming,
    List<Results>? trending,
    DetailsResponse? details,
  }) {
    return GetMoviesState(
      isLoading: isLoading ?? this.isLoading,
      sliderLoading: sliderLoading ?? this.sliderLoading,
      detailsLoading: detailsLoading ?? this.detailsLoading,
      isInitialLoading: isInitialLoading ?? this.isInitialLoading,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
      trending: trending ?? this.trending,
      details: details ?? this.details,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        sliderLoading,
        detailsLoading,
        isInitialLoading,
        nowPlaying,
        popular,
        topRated,
        upcoming,
        trending,
        details,
      ];
}
