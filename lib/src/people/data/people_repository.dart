import 'package:startupshub/src/people/data/people_api.dart';
import 'package:startupshub/src/person/domain/person_model.dart';

class PeopleRepository {
  PeopleRepository() {
    _api = PeopleApi();
  }
  late PeopleApi _api;
  Future<List<Person>> getPeople() async {
    final Map<String, dynamic> data = await _api.fetchPeople();
    final peopleFromJson = data["people"];
    final List<Map<String, dynamic>> peopleList = List.from(peopleFromJson);

    return peopleList.map((item) => Person.fromJson(item)).toList();
  }
}
