import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_helper.dart';
import 'package:movies_app/sections/home_section/data/models/details_response.dart';
import 'package:movies_app/sections/home_section/data/models/now_playing_response.dart';
import 'package:movies_app/sections/home_section/screen/details_screen.dart';

part 'get_movies_event.dart';

part 'get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  int pageNowPlaying = 1;
  int pagePopular = 1;
  int pageTopRated = 1;
  int pageUpcoming = 1;
  final List<Results> _nowPlaying = [];
  final List<Results> _upcoming = [];
  final List<Results> _topRated = [];
  final List<Results> _popular = [];

  GetMoviesBloc() : super(const GetMoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetMoreNowPlayingEvent>(_getMoreNowPlaying);
    on<GetPopularEvent>(_getPopular);
    on<GetMorePopularEvent>(_getMorePopular);
    on<GetTopRatedEvent>(_getTopRated);
    on<GetMoreTopRatedEvent>(_getMoreTopRated);
    on<GetUpcomingEvent>(_getUpcoming);
    on<GetMoreUpcomingEvent>(_getMoreUpcoming);
    on<GetTrendingEvent>(_getTrending);
    on<GetDetailsByIdEvent>(_getDetails);
  }

  Future<void> _getNowPlaying(
    GetNowPlayingEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getNowPlaying(pageNowPlaying);
      if (response.totalPages != 0) {
        _nowPlaying.clear();
        _nowPlaying.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            nowPlaying: _nowPlaying,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getMoreNowPlaying(
    GetMoreNowPlayingEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getNowPlaying(pageNowPlaying + 1);
      if (response.totalPages != 0) {
        pageNowPlaying++;
        _nowPlaying.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            nowPlaying: _nowPlaying,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getPopular(
    GetPopularEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Results> events = [];
    try {
      final response = await ApiHelper.getClient().getPopular(pageUpcoming);
      if (response.totalPages != 0) {
        _popular.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            popular: _popular,
          ),
        );
      }
    }  catch (e) {}
  }
  Future<void> _getMorePopular(
      GetMorePopularEvent event,
      Emitter<GetMoviesState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getPopular(pagePopular + 1);
      if (response.totalPages != 0) {
        pagePopular++;
        _popular.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            nowPlaying: _popular,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getTopRated(
    GetTopRatedEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await ApiHelper.getClient().getTopRated(pageTopRated);
      if (response.totalPages != 0) {
        _topRated.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            topRated: _topRated,
          ),
        );
      }
    }  catch (e) {}
  }

  Future<void> _getMoreTopRated(
      GetMoreTopRatedEvent event,
      Emitter<GetMoviesState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getTopRated(pageTopRated + 1);
      if (response.totalPages != 0) {
        pageTopRated++;
        _topRated.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            nowPlaying: _topRated,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getUpcoming(
    GetUpcomingEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getUpComing(pageUpcoming);
      if (response.totalPages != 0) {
        _upcoming.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            upcoming: _upcoming,
          ),
        );
      }
    } catch (e) {}
  }
  Future<void> _getMoreUpcoming(
      GetMoreUpcomingEvent event,
      Emitter<GetMoviesState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getUpComing(pageUpcoming + 1);
      if (response.totalPages != 0) {
        pageUpcoming++;
    _upcoming.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            nowPlaying: _upcoming,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _getTrending(
    GetTrendingEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(sliderLoading: true));
    List<Results> events = [];
    try {
      final response = await ApiHelper.getClient().getTrending();
      if (response.totalPages != 0) {
        events = response.results ?? [];
        emit(
          state.copyWith(
            sliderLoading: false,
            trending: events,
          ),
        );
      }
    }  catch (e) {}
  }

  Future<void> _getDetails(
    GetDetailsByIdEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(detailsLoading: true));
    DetailsResponse details;
    try {
      final response = await ApiHelper.getClient().getDetails(event.id);
      if (response.runtime != null) {
        details = response;
        emit(
          state.copyWith(
            detailsLoading: false,
            details: details,
          ),
        );
      }
    } catch (e) {}
  }
}
