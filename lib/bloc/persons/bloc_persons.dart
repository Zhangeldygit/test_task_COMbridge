import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/bloc/persons/states.dart';
import '../../dto/person.dart';
import '../../repo/repo_persons.dart';
part 'events.dart';

class BlocPersons extends Bloc<EventBlocPersons, StateBlocPersons> {
  BlocPersons({
    required this.repo,
  }) : super(const StateBlocPersons.initial()) {
    on<EventPersons>((event, emit) async {
      emit(const StateBlocPersons.loading());

      final result = await repo.fetchPersons();

      if (result.errorMessage != null) {
        emit(StateBlocPersons.error(result.errorMessage!));
        return;
      }
      emit(StateBlocPersons.data(data: result.personsList!));
    });

    on<EventPersonsNextPage>((event, emit) async {
      if (_isEndOfData) return;
      if (_isInProgress) return;
      _isInProgress = true;

      final currentData = state.maybeMap(
        data: (value) => value.data,
        orElse: () => <Person>[],
      );

      emit(StateBlocPersons.data(data: currentData, isLoading: true));

      final result = await repo.nextPage(_currentPage + 1);
      if (result.errorMessage != null) {
        emit(StateBlocPersons.data(
          data: currentData,
          errorMessage: result.errorMessage,
        ));
        return;
      }

      emit(StateBlocPersons.data(
          data: [...currentData, ...result.personsList!]));

      _currentPage++;
      _isEndOfData = result.isEndOfData!;
      _isInProgress = false;
    });
  }

  final RepoPersons repo;

  int _currentPage = 1;

  // end-of-data indicator to not request next page if current one is the last one
  bool _isEndOfData = false;

  // an indicator that the request is in progress. needed to avoid parallel requests
  bool _isInProgress = false;
}
