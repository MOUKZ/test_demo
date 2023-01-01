import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_demo/presentation/bloc/form/form_bloc.dart';
import 'package:task_demo/presentation/pages/home/widgets/search/expanded_search_widget/expanded_search_widget_content.dart';

class ExpandedSearchWidget extends StatelessWidget {
  const ExpandedSearchWidget({
    Key? key,
    required this.yearController,
    required Animation<double> expandFactor,
    required this.animationDuration,
  })  : _expandFactor = expandFactor,
        super(key: key);

  final TextEditingController yearController;
  final Animation<double> _expandFactor;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        ExpandedSearchContent(
          controller: yearController,
          heightFactor: _expandFactor.value,
        ),
        InkWell(
          onTap: () {
            final bloc = context.read<FormBloc>();
            bloc.state.isSearchExpanded
                ? bloc.add(FormCollapsed())
                : bloc.add(FormExpanded());
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: animationDuration,
                child: !context.read<FormBloc>().state.isSearchExpanded
                    ? const Icon(Icons.arrow_drop_down)
                    : const Icon(Icons.arrow_drop_up),
              ),
              const Text('view more')
            ],
          ),
        )
      ],
    );
  }
}
