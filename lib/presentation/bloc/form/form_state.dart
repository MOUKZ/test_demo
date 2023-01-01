part of 'form_bloc.dart';

class SearchFormState extends Equatable {
  const SearchFormState({
    this.query = '',
    this.year = '',
    this.queryError = '',
    this.isSearchExpanded = false,
    this.isSubmitted = false,
  });
  SearchFormState copyWith(
      {String? query,
      String? year,
      String? queryError,
      bool? isSearchExpanded,
      bool? isSubmitted}) {
    return SearchFormState(
      queryError: queryError ?? this.queryError,
      isSearchExpanded: isSearchExpanded ?? this.isSearchExpanded,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      query: query ?? this.query,
      year: year ?? this.year,
    );
  }

  final String query;

  final String year;

  final String queryError;

  final bool isSearchExpanded;
  final bool isSubmitted;

  @override
  List<Object> get props => [
        query,
        year,
        queryError,
        isSearchExpanded,
        isSubmitted,
      ];
}
