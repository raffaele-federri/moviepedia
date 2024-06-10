import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/api/api_helper.dart';
import 'package:movies_app/sections/home_section/data/models/details_response.dart';
import 'package:movies_app/sections/home_section/data/models/now_playing_response.dart';
import 'package:movies_app/sections/home_section/screen/details_screen.dart';

part 'get_movies_event.dart';

part 'get_movies_state.dart';

class GetMoviesBloc extends Bloc<GetMoviesEvent, GetMoviesState> {
  GetMoviesBloc() : super(const GetMoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetPopularEvent>(_getPopular);
    on<GetTopRatedEvent>(_getTopRated);
    on<GetUpcomingEvent>(_getUpcoming);
    on<GetTrendingEvent>(_getTrending);
    on<GetDetailsByIdEvent>(_getDetails);
  }

  Future<void> _getNowPlaying(
    GetNowPlayingEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Results> events = [];
    try {
      final response = await ApiHelper.getClient().getNowPlaying();
      if (response.totalPages != 0) {
        events = response.results ?? [];
        emit(
          state.copyWith(
            isLoading: false,
            nowPlaying: events,
          ),
        );
      }
    } on SocketException {
      // emit(const ContactsState.error('No Internet Connection'));
    } catch (e) {
      // emit(
      //   ContactsState.error(
      //     e.toString().contains('401')
      //         ? 'Incorrect Password'
      //         : 'Your OTP code has expired',
      //   ),
      // );
    }
  }

  Future<void> _getPopular(
    GetPopularEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Results> events = [];
    try {
      final response = await ApiHelper.getClient().getPopular();
      if (response.totalPages != 0) {
        events = response.results ?? [];
        emit(
          state.copyWith(
            isLoading: false,
            popular: events,
          ),
        );
      }
    } on SocketException {
      // emit(const ContactsState.error('No Internet Connection'));
    } catch (e) {
      // emit(
      //   ContactsState.error(
      //     e.toString().contains('401')
      //         ? 'Incorrect Password'
      //         : 'Your OTP code has expired',
      //   ),
      // );
    }
  }

  Future<void> _getTopRated(
    GetTopRatedEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Results> events = [];
    try {
      final response = await ApiHelper.getClient().getTopRated();
      if (response.totalPages != 0) {
        events = response.results ?? [];
        emit(
          state.copyWith(
            isLoading: false,
            topRated: events,
          ),
        );
      }
    } on SocketException {
      // emit(const ContactsState.error('No Internet Connection'));
    } catch (e) {
      // emit(
      //   ContactsState.error(
      //     e.toString().contains('401')
      //         ? 'Incorrect Password'
      //         : 'Your OTP code has expired',
      //   ),
      // );
    }
  }

  Future<void> _getUpcoming(
    GetUpcomingEvent event,
    Emitter<GetMoviesState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Results> events = [];
    try {
      final response = await ApiHelper.getClient().getUpComing();
      if (response.totalPages != 0) {
        events = response.results ?? [];
        emit(
          state.copyWith(
            isLoading: false,
            upcoming: events,
          ),
        );
      }
    } on SocketException {
      // emit(const ContactsState.error('No Internet Connection'));
    } catch (e) {
      // emit(
      //   ContactsState.error(
      //     e.toString().contains('401')
      //         ? 'Incorrect Password'
      //         : 'Your OTP code has expired',
      //   ),
      // );
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
    } on SocketException {
      // emit(const ContactsState.error('No Internet Connection'));
    } catch (e) {
      // emit(
      //   ContactsState.error(
      //     e.toString().contains('401')
      //         ? 'Incorrect Password'
      //         : 'Your OTP code has expired',
      //   ),
      // );
    }
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
    } on SocketException {
      // emit(const ContactsState.error('No Internet Connection'));
    } catch (e) {
      // emit(
      //   ContactsState.error(
      //     e.toString().contains('401')
      //         ? 'Incorrect Password'
      //         : 'Your OTP code has expired',
      //   ),
      // );
    }
  }
}
