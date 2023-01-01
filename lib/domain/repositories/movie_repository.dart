import '../entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> searchMovies(String query, int page, String year);
  Future<Movie> getMovieDetails(String id);
}
