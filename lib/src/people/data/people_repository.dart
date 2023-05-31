import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/people/data/people_api.dart';
import 'package:startupshub/src/people/domain/people_model.dart';
import 'package:startupshub/src/person/domain/person_model.dart';

class PeopleRepository {
  PeopleRepository() {
    _api = PeopleApi();
  }
  late PeopleApi _api;
  Future<People> fetchPeople() async {
    final Map<String, dynamic> data = await _api.fetchPeople();
    final peopleFromJson = data["people"];
    final List<Map<String, dynamic>> peopleList = List.from(peopleFromJson);

    final List<Person> list =
        peopleList.map((item) => Person.fromJson(item)).toList();

    return People(list: list);
  }
}

final peopleRepositoryProvider =
    Provider<PeopleRepository>((ref) => PeopleRepository());
