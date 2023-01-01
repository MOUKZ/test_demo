import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieForegroundImage extends StatelessWidget {
  const MovieForegroundImage({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: (url == null || url == 'N/A')
          ? Image.asset(
              'assets/images/error_image.jpeg',
              height: MediaQuery.of(context).size.height * 0.4,
            )
          : CachedNetworkImage(
              height: MediaQuery.of(context).size.height * 0.4,
              imageUrl: url!,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
  }
}
