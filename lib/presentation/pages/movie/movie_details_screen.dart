import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/constants/app_colors.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/presentation/bloc/details/details_bloc.dart';
import 'package:task_demo/presentation/pages/movie/widgets/movie_back_ground_image.dart';
import 'package:task_demo/presentation/pages/movie/widgets/movie_cast_and_plot_widget.dart';
import 'package:task_demo/presentation/pages/movie/widgets/movie_foreground_image.dart';
import 'package:task_demo/presentation/pages/movie/widgets/movie_params_widget.dart';
import 'package:task_demo/presentation/pages/shared/custom_error_widget.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String route = '/movie-details';
  final Movie movie;
  const MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Stack(
        children: [
          MovieBackGroundWidget(url: movie.poster),
          Positioned.fill(
              child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MovieForegroundImage(url: movie.poster),
                    const SizedBox(height: 10),
                    Text(
                      movie.title ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    BlocConsumer<DetailsBloc, DetailsState>(
                      listener: (context, state) {
                        if (state is DetailsLoadingState) {
                          BotToast.showLoading();
                        } else {
                          BotToast.closeAllLoading();
                        }
                      },
                      builder: (context, state) {
                        if (state is DetailsLoadedState) {
                          return Column(
                            children: [
                              MovieParamsWidget(movie: movie),
                              const SizedBox(height: 15),
                              MovieCastAndPlotWidget(
                                state: state,
                              )
                            ],
                          );
                        }

                        if (state is DetailsErrorState) {
                          return CustomErrorWidget(
                            title: state.error,
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
