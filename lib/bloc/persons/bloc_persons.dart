
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dto/person.dart';
import '../../repo/repo_persons.dart';
part 'events.dart';
part 'states.dart';

class BlocPersons extends Bloc<EventBlocPersons, StateBlocPersons> {
  BlocPersons({
    required this.repo,
  }) : super(StatePersonsInitial()) {
    on<EventPersons>(
      (event, emit) async {
        emit(StatePersonsLoading());
        final result = await repo.fetchPersons();
        if (result.errorMessage != null) {
          emit(
            StatePersonsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StatePersonsData(data: result.personsList!),
        );
      },
    );
  }

  final RepoPersons repo;
}
