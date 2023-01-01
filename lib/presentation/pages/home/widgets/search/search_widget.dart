import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/presentation/bloc/form/form_bloc.dart';
import 'package:task_demo/presentation/bloc/search/search_bloc.dart';
import 'package:task_demo/presentation/pages/home/widgets/search/custom_search_button.dart';
import 'package:task_demo/presentation/pages/home/widgets/search/custom_text_field.dart';
import 'package:task_demo/presentation/pages/home/widgets/search/expanded_search_widget/expanded_search_widget.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _expandFactor;

  final animationDuration = const Duration(milliseconds: 300);
  final queryController = TextEditingController();
  final yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: animationDuration,
      vsync: this,
    );
    _expandFactor = _controller.drive(
      Tween(
        begin: 0.0,
        end: 1.0,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  Widget _buildChild(BuildContext context, Widget? child) {
    return Column(
      children: [
        CustomTextField(
          hintText: 'Search Movies',
          controller: queryController,
          onChanged: (query) {
            context.read<FormBloc>().add(QueryChanged(query: query));
          },
          errorString: context.read<FormBloc>().state.queryError.isNotEmpty
              ? context.read<FormBloc>().state.queryError
              : null,
        ),
        const SizedBox(
          height: 8,
        ),
        CustomSearchButton(
          onPressed: () {
            context.read<FormBloc>().add(FormSubmitted());
          },
        ),
        ExpandedSearchWidget(
            yearController: yearController,
            expandFactor: _expandFactor,
            animationDuration: animationDuration),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormBloc(),
      child: BlocConsumer<FormBloc, SearchFormState>(
        listener: (context, state) {
          state.isSearchExpanded
              ? _controller.forward()
              : _controller.reverse();
          if (state.isSubmitted) {
            if (state.queryError.isEmpty) {
              context
                  .read<MovieSearchBloc>()
                  .add(OnQueryChanged(query: state.query, year: state.year));
              context.read<FormBloc>().add(FormReset());
              yearController.clear();
              queryController.clear();
            }
          }
        },
        builder: (context, state) {
          return AnimatedBuilder(
            animation: _controller.view,
            builder: _buildChild,
          );
        },
      ),
    );
  }
}
