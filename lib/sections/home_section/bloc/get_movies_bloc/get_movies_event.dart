part of 'get_movies_bloc.dart';

sealed class GetMoviesEvent extends Equatable {
  const GetMoviesEvent();
}

class GetNowPlayingEvent extends GetMoviesEvent {
  const GetNowPlayingEvent();

  @override
  List<Object?> get props => [];
}

class GetMoreNowPlayingEvent extends GetMoviesEvent {
  const GetMoreNowPlayingEvent();

  @override
  List<Object?> get props => [];
}

class GetPopularEvent extends GetMoviesEvent {
  const GetPopularEvent();

  @override
  List<Object?> get props => [];
}

class GetMorePopularEvent extends GetMoviesEvent {
  const GetMorePopularEvent();

  @override
  List<Object?> get props => [];
}

class GetTopRatedEvent extends GetMoviesEvent {
  const GetTopRatedEvent();

  @override
  List<Object?> get props => [];
}

class GetMoreTopRatedEvent extends GetMoviesEvent {
  const GetMoreTopRatedEvent();

  @override
  List<Object?> get props => [];
}

class GetUpcomingEvent extends GetMoviesEvent {
  const GetUpcomingEvent();

  @override
  List<Object?> get props => [];
}

class GetMoreUpcomingEvent extends GetMoviesEvent {
  const GetMoreUpcomingEvent();

  @override
  List<Object?> get props => [];
}

class GetTrendingEvent extends GetMoviesEvent {
  const GetTrendingEvent();

  @override
  List<Object?> get props => [];
}

class GetDetailsByIdEvent extends GetMoviesEvent {
  const GetDetailsByIdEvent({required this.id});

  final int id;

  @override
  List<Object?> get props => [id];
}
