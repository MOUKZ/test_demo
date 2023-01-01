import 'dart:convert';
import 'package:http/http.dart';
import 'package:task_demo/data/data_sources/movie_remote_data_source.dart';
import 'package:task_demo/data/models/movie_details_raw_response.dart';
import 'package:task_demo/data/models/movie_search_raw_item_response.dart';
import 'package:task_demo/data/models/movie_search_list_raw_response.dart';
import 'package:task_demo/constants/urls.dart';
import 'package:task_demo/exceptions/movie_not_fount_exciption.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl();

  @override
  Future<List<MovieSearchRawItemResponse>> searchMovies(
      String query, int page, String year) async {
    final response = await get(Uri.parse(
      Urls.searchMovies(
        query,
        page.toString(),
        year.toString(),
      ),
    ));

    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final responseModel = MovieSearchListRawResponse.fromJson(map);
      if (!responseModel.response!) {
        if (responseModel.error!.contains('found')) {
          throw MovieNotFountException();
        } else {
          throw CustomException(responseModel.error!);
        }
      }

      return responseModel.movieList!;
    } else {
      throw CustomException('unexpected error');
    }
  }

  @override
  Future<MovieDetailsRawResponse> getMovieDetails(String id) async {
    try {
      final response = await get(Uri.parse(Urls.movieDetails(id)));

      if (response.statusCode == 200) {
        final map = json.decode(response.body);
        final movieModel = MovieDetailsRawResponse.fromJson(map);
        if (!movieModel.response!) {
          if (movieModel.error!.contains('found')) {
            throw MovieNotFountException();
          } else {
            throw CustomException(movieModel.error!);
          }
        }
        return MovieDetailsRawResponse.fromJson(map);
      } else {
        throw CustomException('Server Error');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
