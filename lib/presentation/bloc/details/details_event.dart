part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetailsEvent extends DetailsEvent {
  final String id;
  const GetDetailsEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
