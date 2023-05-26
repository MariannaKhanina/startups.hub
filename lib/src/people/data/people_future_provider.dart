import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/people/data/people_repository.dart';
import 'package:startupshub/src/person/domain/person_model.dart';

final peopleFutureProvider = FutureProvider<List<Person>>((ref) async {
  final PeopleRepository repository = ref.read(peopleRepositoryProvider);

  return await repository.getPeople();
});
