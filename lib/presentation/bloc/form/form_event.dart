part of 'form_bloc.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class QueryChanged extends FormEvent {
  const QueryChanged({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}

class YearChanged extends FormEvent {
  const YearChanged({required this.year});

  final String year;

  @override
  List<Object> get props => [year];
}

class FormExpanded extends FormEvent {}

class FormCollapsed extends FormEvent {}

class FormSubmitted extends FormEvent {}

class FormReset extends FormEvent {}
