part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState({
    this.isLoading = false,
    this.trending = const [],
  });

  final bool isLoading;
  final List<SearchResults> trending;

  SearchState copyWith({
    bool? isLoading,
    List<SearchResults>? trending,
  }) {
    return SearchState(
      isLoading: isLoading ?? this.isLoading,
      trending: trending ?? this.trending,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        trending,
      ];
}
