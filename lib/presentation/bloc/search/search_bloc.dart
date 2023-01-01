import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/domain/use_cases/search_movies_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class MovieSearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchMoviesUseCase _searchMovies;

  MovieSearchBloc(this._searchMovies) : super(SearchEmpty()) {
    on<OnQueryChanged>(
      (event, emit) async {
        final query = event.query;
        final year = event.year;
        List<Movie> oldResult = [];
        int page = 1;
        if (state is MovieSearchHasData) {
          oldResult = (state as MovieSearchHasData).result;
          page = (state as MovieSearchHasData).page + 1;
        }

        emit(SearchLoading(
            oldResult: oldResult,
            isFirstFitch: event.isInitialSearch,
            query: query,
            year: event.year));

        try {
          final result = await _searchMovies.execute(query, page, year);
          List<Movie> list = result;
          if (!event.isInitialSearch) {
            oldResult.addAll(result);
            list = oldResult;
          }
          if (event.isInitialSearch && result.isEmpty) {
            emit(const SearchError('Movie Not Found'));
            return;
          }

          emit(MovieSearchHasData(
              result: list, query: event.query, year: event.year, page: page));
        } catch (e) {
          // emit(const SearchError('Error Connecting To Server'));
          emit(SearchError(e.toString()));
        }
      },
    );
  }
}
