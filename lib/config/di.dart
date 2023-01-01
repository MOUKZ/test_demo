import 'package:get_it/get_it.dart';
import 'package:task_demo/data/repositories/movie_repository_impl.dart';
import 'package:task_demo/domain/repositories/movie_repository.dart';
import 'package:task_demo/domain/use_cases/get_movie_detail_use_case.dart';

import '../data/data_sources/movie_remote_data_source.dart';
import '../data/data_sources/movie_remote_data_source_impl.dart';
import '../domain/use_cases/search_movies_use_case.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton(() => SearchMoviesUseCase(locator()));
  locator.registerLazySingleton(() => GetMovieDetailUseCase(locator()));

  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());
}
