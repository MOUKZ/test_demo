import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task_demo/constants/app_colors.dart';

class MovieBackGroundWidget extends StatelessWidget {
  const MovieBackGroundWidget({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: ((url == null || url == 'N/A')
              ? const AssetImage('assets/images/error_image.jpeg')
              : CachedNetworkImageProvider(
                  url!,
                )) as ImageProvider,
        ),
      ),
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.darkBlue.withOpacity(0.8),
            AppColors.darkBlue.withOpacity(0.8),
            AppColors.darkBlue,
            AppColors.darkBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
