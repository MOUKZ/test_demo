import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/domain/use_cases/get_movie_detail_use_case.dart';
import 'package:task_demo/domain/use_cases/search_movies_use_case.dart';
import 'package:task_demo/presentation/bloc/details/details_bloc.dart';
import 'package:task_demo/presentation/bloc/search/search_bloc.dart';
import 'package:task_demo/presentation/pages/home/movie_home_page.dart';
import 'package:task_demo/presentation/pages/movie/movie_details_screen.dart';

import 'di.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                MovieSearchBloc(locator<SearchMoviesUseCase>()),
            child: const MovieHomePage(),
          ),
        );
      case MovieDetailsScreen.route:
        final movie = settings.arguments as Movie;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => DetailsBloc(locator<GetMovieDetailUseCase>())
              ..add(
                GetDetailsEvent(id: movie.imdbID!),
              ),
            child: MovieDetailsScreen(
              movie: movie,
            ),
          ),
        );
      default:
        return null;
    }
  }
}
