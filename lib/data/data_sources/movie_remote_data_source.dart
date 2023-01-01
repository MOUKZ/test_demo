import 'package:task_demo/data/models/movie_details_raw_response.dart';
import 'package:task_demo/data/models/movie_search_raw_item_response.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieSearchRawItemResponse>> searchMovies(
      String query, int page, String year);
  Future<MovieDetailsRawResponse> getMovieDetails(String id);
}
