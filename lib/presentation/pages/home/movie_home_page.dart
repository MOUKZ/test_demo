import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/presentation/bloc/search/search_bloc.dart';
import 'package:task_demo/presentation/pages/home/widgets/search/search_widget.dart';
import 'package:task_demo/presentation/pages/shared/custom_error_widget.dart';

import 'widgets/movies_list/movies_list.dart';

class MovieHomePage extends StatelessWidget {
  const MovieHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchWidget(),
            BlocConsumer<MovieSearchBloc, SearchState>(
              listener: (context, state) {
                if (state is SearchLoading) {
                  BotToast.showLoading();
                } else {
                  BotToast.closeAllLoading();
                }
              },
              builder: (context, state) {
                if (state is SearchLoading && !state.isFirstFitch) {
                  final result = state.oldResult;
                  return MoviesListWidget(movieList: result);
                } else if (state is MovieSearchHasData) {
                  final result = state.result;
                  return MoviesListWidget(movieList: result);
                } else if (state is SearchError) {
                  return Expanded(
                    child: CustomErrorWidget(
                      title: state.message,
                    ),
                  );
                } else {
                  return Expanded(
                    child: Container(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
