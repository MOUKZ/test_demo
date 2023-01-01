import 'package:flutter/material.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/presentation/pages/movie/widgets/title_column_widget.dart';
import 'package:task_demo/presentation/pages/shared/custom_chip.dart';

class MovieParamsWidget extends StatelessWidget {
  const MovieParamsWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TitleColumnWidget(
          value: movie.runtime,
          title: 'Length',
        ),
        const SizedBox(width: 5),
        TitleColumnWidget(
          value: movie.year,
          title: 'Release Date',
        ),
        const SizedBox(width: 5),
        TitleColumnWidget(
          value: movie.language,
          title: 'Language',
        ),
        const SizedBox(width: 5),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Rated'),
            SizedBox(height: 5),
            CustomChip(
              title: 'R',
              color: Colors.redAccent,
            )
          ],
        ),
      ],
    );
  }
}
