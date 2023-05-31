import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/people/application/people_service.dart';
import 'package:startupshub/src/people/domain/people_model.dart';
import 'package:startupshub/src/person/domain/person_model.dart';
import 'package:startupshub/src/projects/application/projects_service.dart';
import 'package:startupshub/src/projects/domain/projects_model.dart';

class PeopleController extends StateNotifier<AsyncValue<People?>> {
  PeopleController({
    required this.peopleService,
    required this.projectsService,
  }) : super(const AsyncData(null));

  final PeopleService peopleService;
  final ProjectsService projectsService;

  void init() async {
    state = const AsyncLoading();
    final People people = await peopleService.fetchPeople();
    final Projects projects = await projectsService.fetchProjects();

    final List<Person> personList = people.list.map((person) {
      person.projects = projects.getProjectsByIds(person.projectsIds);
      return person;
    }).toList();
    people.list.setAll(0, personList);
    state = AsyncData(people);
  }
}

final peopleControllerProvider =
    StateNotifierProvider<PeopleController, AsyncValue<People?>>((ref) {
  final PeopleController controller = PeopleController(
    peopleService: ref.watch(peopleServiceProvider),
    projectsService: ref.watch(projectsServiceProvider),
  );
  controller.init();
  return controller;
});
