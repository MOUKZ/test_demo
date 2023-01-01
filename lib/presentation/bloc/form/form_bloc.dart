import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, SearchFormState> {
  FormBloc() : super(const SearchFormState()) {
    on<QueryChanged>(_onQueryChanged);
    on<YearChanged>(_onYearChanged);
    on<FormSubmitted>(_onFormSubmitted);
    on<FormExpanded>(_onFormExpanded);
    on<FormCollapsed>(_onFormCollapsed);
    on<FormReset>(_onFormReset);
  }
  void _onQueryChanged(QueryChanged event, Emitter<SearchFormState> emit) {
    final query = event.query;
    emit(
      state.copyWith(
        query: query,
        queryError: '',
      ),
    );
  }

  void _onYearChanged(YearChanged event, Emitter<SearchFormState> emit) {
    final year = event.year;
    emit(
      state.copyWith(
        year: year,
      ),
    );
  }

  Future<void> _onFormSubmitted(
    FormSubmitted event,
    Emitter<SearchFormState> emit,
  ) async {
    final query = state.query;
    final year = state.year;
    String errorMessage = '';
    if (query.isEmpty) {
      errorMessage = 'Query could not be empty';
    }
    emit(
      state.copyWith(
        query: query,
        year: year,
        queryError: errorMessage,
        isSubmitted: errorMessage.isEmpty,
      ),
    );
  }

  void _onFormExpanded(FormExpanded event, Emitter<SearchFormState> emit) {
    emit(
      state.copyWith(
        query: state.query,
        year: state.year,
        isSearchExpanded: true,
        isSubmitted: false,
      ),
    );
  }

  void _onFormCollapsed(FormCollapsed event, Emitter<SearchFormState> emit) {
    emit(
      state.copyWith(
        query: state.query,
        year: state.year,
        isSearchExpanded: false,
        isSubmitted: false,
      ),
    );
  }

  void _onFormReset(FormReset event, Emitter<SearchFormState> emit) {
    emit(state.copyWith(
      query: '',
      year: '',
      queryError: '',
      isSearchExpanded: false,
      isSubmitted: false,
    ));
  }
}
