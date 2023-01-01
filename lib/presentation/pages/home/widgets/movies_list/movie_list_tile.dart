import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_demo/constants/app_colors.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/presentation/pages/movie/movie_details_screen.dart';
import 'package:task_demo/presentation/pages/shared/custom_chip.dart';

class MovieListTile extends StatelessWidget {
  final Movie movie;
  const MovieListTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(MovieDetailsScreen.route, arguments: movie);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: (movie.poster == null || movie.poster == 'N/A')
                    ? Image.asset(
                        'assets/images/error_image.jpeg',
                      )
                    : CachedNetworkImage(
                        imageUrl: movie.poster!,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      CustomChip(
                        title: movie.year ?? '',
                      ),
                      const SizedBox(width: 16.0),
                      CustomChip(
                        title: movie.type ?? '',
                        color: AppColors.darkBlue,
                      )
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'ID: ${movie.imdbID ?? 'N/A'}',
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
