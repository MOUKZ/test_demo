import 'package:task_demo/domain/entities/movie.dart';

import '../repositories/movie_repository.dart';

class GetMovieDetailUseCase {
  final MovieRepository repository;

  GetMovieDetailUseCase(this.repository);

  Future<Movie> execute(String id) {
    return repository.getMovieDetails(id);
  }
}
