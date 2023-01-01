import 'package:flutter/material.dart';
import 'package:task_demo/presentation/bloc/details/details_bloc.dart';

class MovieCastAndPlotWidget extends StatelessWidget {
  final DetailsLoadedState state;
  const MovieCastAndPlotWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Cast: ${state.movie.actors}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Plot: ${state.movie.plot}',
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, wordSpacing: 1.5),
            ),
          )
        ],
      ),
    );
  }
}
