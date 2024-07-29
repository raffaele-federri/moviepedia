import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/api/api_helper.dart';
import 'package:movies_app/sections/searching_section/models/search_response.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  int pageNowPlaying = 1;

  final List<SearchResults> _nowPlaying = [];

  SearchBloc() : super(SearchState()) {
    on<GetSearchEvent>(_getNowPlaying);
  }
  Future<void> _getNowPlaying(
      SearchEvent event,
      Emitter<SearchState> emit,
      ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final response = await ApiHelper.getClient().getSearch(pageNowPlaying, 'titanic');
      if (response.totalPages != 0) {
        _nowPlaying.clear();
        _nowPlaying.addAll(response.results ?? []);
        emit(
          state.copyWith(
            isLoading: false,
            trending: _nowPlaying,
          ),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
