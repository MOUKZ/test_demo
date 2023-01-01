import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/domain/repositories/movie_repository.dart';

class SearchMoviesUseCase {
  final MovieRepository repository;

  SearchMoviesUseCase(this.repository);

  Future<List<Movie>> execute(String query, int page, String year) {
    return repository.searchMovies(query, page, year);
  }
}
