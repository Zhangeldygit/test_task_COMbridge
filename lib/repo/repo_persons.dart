import '../dto/person.dart';

import 'api.dart';

class RepoPersons {
  RepoPersons({required this.api});

  final Api api;

  Future<ResultRepoPersons> fetchPersons() => nextPage(1);

  Future<ResultRepoPersons> nextPage(int page) async {
    try {
      final result = await api.dio.get(
        '/character?page=$page',
      );

      // if the [next] field contains nothing, then there are no more pages
      final bool isEndOfData = result.data['info']['next'] == null;

      final List personsListJson = result.data['results'] ?? [];

      final personsList =
          personsListJson.map((item) => Person.fromJson(item)).toList();

      return ResultRepoPersons(
          personsList: personsList, isEndOfData: isEndOfData);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoPersons(
        errorMessage: 'Something went wrong',
      );
    }
  }
}

class ResultRepoPersons {
  ResultRepoPersons({this.errorMessage, this.personsList, this.isEndOfData});

  final String? errorMessage;
  final List<Person>? personsList;
  final bool? isEndOfData;
}
