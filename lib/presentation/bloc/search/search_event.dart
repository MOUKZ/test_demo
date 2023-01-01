part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class OnQueryChanged extends SearchEvent {
  final String query;
  final String year;
  final bool isInitialSearch;
  final int pageKey;

  const OnQueryChanged(
      {required this.query,
      required this.year,
      this.pageKey = 0,
      this.isInitialSearch = true});

  @override
  List<Object?> get props => [query, year, pageKey, isInitialSearch];
}
