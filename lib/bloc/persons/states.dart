// part of 'bloc_persons.dart';

// abstract class StateBlocPersons {}

// class StatePersonsInitial extends StateBlocPersons {}

// class StatePersonsLoading extends StateBlocPersons {}

// class StatePersonsData extends StateBlocPersons {
//   StatePersonsData({
//     required this.data,
//   });

//   final List<Person> data;
// }

// class StatePersonsError extends StateBlocPersons {
//   StatePersonsError(this.error);

//   final String error;
// }
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../dto/person.dart';

part 'states.freezed.dart';

@freezed
class StateBlocPersons with _$StateBlocPersons {
  const factory StateBlocPersons.initial() = StatePersonsInitial;
  const factory StateBlocPersons.loading() = StatePersonsLoading;
  const factory StateBlocPersons.data(
      {required List<Person> data,
      @Default(false) bool isLoading,
      String? errorMessage}) = StatePersonsData;
  const factory StateBlocPersons.error(String error) = StatePersonsError;
}

// the class with data (StateEpisodesData) also contains a load flag and an error message. They are needed to indicate the status during the loading of the next page of data so that the current data is not lost.
