part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchEmpty extends SearchState {}

class SearchLoading extends SearchState {
  final List<Movie> oldResult;
  final bool isFirstFitch;
  final String query;
  final String year;

  const SearchLoading(
      {required this.query,
      required this.year,
      required this.oldResult,
      this.isFirstFitch = false});
  @override
  List<Object?> get props => [oldResult, query, year, isFirstFitch];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieSearchHasData extends SearchState {
  final List<Movie> result;
  final String query;
  final String year;
  final int page;

  const MovieSearchHasData(
      {required this.result,
      required this.query,
      required this.year,
      this.page = 1});

  @override
  List<Object?> get props => [result, query, year, page];
}
