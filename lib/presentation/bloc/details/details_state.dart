part of 'details_bloc.dart';

abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final Movie movie;

  const DetailsLoadedState(this.movie);
  @override
  List<Object> get props => [movie];
}

class DetailsErrorState extends DetailsState {
  final String error;
  const DetailsErrorState(
    this.error,
  );
  @override
  List<Object> get props => [error];
}
