import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/presentation/bloc/form/form_bloc.dart';
import 'package:task_demo/presentation/pages/home/widgets/search/custom_text_field.dart';

class ExpandedSearchContent extends StatelessWidget {
  final TextEditingController controller;
  final double? heightFactor;

  const ExpandedSearchContent({
    super.key,
    this.heightFactor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: heightFactor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              controller: controller,
              hintText: 'Release Year',
              prefixIcon: Icons.date_range,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              onChanged: (year) {
                context.read<FormBloc>().add(YearChanged(year: year));
              },
            ),
          ],
        ),
      ),
    );
  }
}
