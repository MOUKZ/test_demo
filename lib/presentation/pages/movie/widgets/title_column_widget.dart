import 'package:flutter/material.dart';

class TitleColumnWidget extends StatelessWidget {
  final String title;
  final String? value;
  const TitleColumnWidget({
    Key? key,
    this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title,
            style: const TextStyle(
              fontSize: 16,
            )),
        const SizedBox(height: 5),
        Text(
          value ?? 'N/A',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
