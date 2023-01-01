import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  const CustomErrorWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        maxLines: 1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
