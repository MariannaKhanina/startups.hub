import 'package:startupshub/src/person/domain/person_model.dart';

class People {
  People({
    required this.list,
  });

  final List<Person> list;

  List<Person> getPeopleByIds(List<String> peopleIds) {
    if (list.isEmpty) return [];
    return list.where((person) => peopleIds.contains(person.id)).toList();
  }
}
