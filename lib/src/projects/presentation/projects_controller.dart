import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/people/application/people_service.dart';
import 'package:startupshub/src/people/domain/people_model.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/projects/application/projects_service.dart';
import 'package:startupshub/src/projects/domain/projects_model.dart';

class ProjectsController extends StateNotifier<AsyncValue<Projects?>> {
  ProjectsController({
    required this.projectsService,
    required this.peopleService,
  }) : super(const AsyncData(null));

  final ProjectsService projectsService;
  final PeopleService peopleService;

  void init() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => projectsService.fetchProjects());

    final Projects projects = await projectsService.fetchProjects();
    final People people = await peopleService.fetchPeople();

    final List<Project> projectsList = projects.list.map((project) {
      project.people = people.getPeopleByIds(project.peopleIds);
      return project;
    }).toList();
    projects.list.setAll(0, projectsList);
    state = AsyncData(projects);
  }
}

final projectsControllerProvider =
    StateNotifierProvider<ProjectsController, AsyncValue<Projects?>>((ref) {
  final ProjectsController controller = ProjectsController(
    projectsService: ref.watch(projectsServiceProvider),
    peopleService: ref.watch(peopleServiceProvider),
  );
  controller.init();
  return controller;
});
