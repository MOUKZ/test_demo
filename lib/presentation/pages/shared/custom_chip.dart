import 'package:flutter/material.dart';
import 'package:task_demo/constants/app_colors.dart';

class CustomChip extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomChip({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColors.darkPurple,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(title),
    );
  }
}
