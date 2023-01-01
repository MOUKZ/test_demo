import 'package:flutter/material.dart';

class CustomSearchButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomSearchButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.search,
              color: Colors.white70,
            ),
            SizedBox(
              width: 5,
            ),
            Text('Search')
          ],
        ));
  }
}
