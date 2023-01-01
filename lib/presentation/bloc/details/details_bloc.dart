// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_demo/domain/entities/movie.dart';
import 'package:task_demo/domain/use_cases/get_movie_detail_use_case.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetMovieDetailUseCase _getMovieDetailUseCase;
  DetailsBloc(this._getMovieDetailUseCase) : super(DetailsLoadingState()) {
    on<GetDetailsEvent>((event, emit) async {
      final id = event.id;

      emit(DetailsLoadingState());

      try {
        final result = await _getMovieDetailUseCase.execute(id);
        emit(DetailsLoadedState(result));
      } catch (e) {
        emit(DetailsErrorState(e.toString()));
      }
    });
  }
}
