
import '../dto/person.dart';

import 'api.dart';

class RepoPersons {
  RepoPersons({required this.api});

  final Api api;

  Future<ResultRepoPersons> fetchPersons() async {
    try {
      final result = await api.dio.get(
        '/character',
      );

      final List personsListJson = result.data['results'] ?? [];
      final personsList = personsListJson
          .map(
            (item) => Person.fromJson(item),
      )
          .toList();
      return ResultRepoPersons(personsList: personsList);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoPersons(
        errorMessage: 'Something went wrong',
      );
    }
  }
}

class ResultRepoPersons {
  ResultRepoPersons({
    this.errorMessage,
    this.personsList,
  });

  final String? errorMessage;
  final List<Person>? personsList;
}