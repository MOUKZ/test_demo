import 'package:task_demo/data/data_sources/movie_remote_data_source.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/domain/repositories/movie_repository.dart';

import '../../exceptions/movie_not_fount_exciption.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Movie>> searchMovies(String query, int page, String year) async {
    try {
      final result = await remoteDataSource.searchMovies(query, page, year);
      final list = result.map((model) => model.toEntity()).toList();

      return list;
    } on MovieNotFountException catch (_) {
      return [];
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<Movie> getMovieDetails(String id) async {
    try {
      final result = await remoteDataSource.getMovieDetails(id);
      return result.toEntity();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
