part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();
}


class GetSearchEvent extends SearchEvent {
  const GetSearchEvent();

  @override
  List<Object?> get props => [];
}