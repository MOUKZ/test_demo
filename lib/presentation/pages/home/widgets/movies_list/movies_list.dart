import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/presentation/bloc/search/search_bloc.dart';
import 'package:task_demo/presentation/pages/home/widgets/movies_list/movie_list_tile.dart';

class MoviesListWidget extends StatefulWidget {
  final List<Movie> movieList;
  const MoviesListWidget({
    Key? key,
    required this.movieList,
  }) : super(key: key);

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  final controller = ScrollController();
  void listener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      if (controller.position.pixels != 0) {
        final bloc = context.read<MovieSearchBloc>();
        String? query;
        String? year;
        if (bloc.state is MovieSearchHasData) {
          query = (bloc.state as MovieSearchHasData).query;
          year = (bloc.state as MovieSearchHasData).year;
        } else {
          query = (bloc.state as SearchLoading).query;
          year = (bloc.state as SearchLoading).year;
        }
        bloc.add(
            OnQueryChanged(query: query, year: year, isInitialSearch: false));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(listener);
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemCount: widget.movieList.length,
        padding: const EdgeInsets.only(top: 16),
        itemBuilder: (context, index) {
          final movie = widget.movieList[index];
          return MovieListTile(
            movie: movie,
          );
        },
      ),
    );
  }
}
