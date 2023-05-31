import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/people/data/people_repository.dart';
import 'package:startupshub/src/people/domain/people_model.dart';

class PeopleService {
  PeopleService({
    required this.peoplePropsitory,
  });

  final PeopleRepository peoplePropsitory;

  Future<People> fetchPeople() {
    return peoplePropsitory.fetchPeople();
  }
}

final peopleServiceProvider = Provider<PeopleService>((ref) => PeopleService(
      peoplePropsitory: ref.watch(peopleRepositoryProvider),
    ));
