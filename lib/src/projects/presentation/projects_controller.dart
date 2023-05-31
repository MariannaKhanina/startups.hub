import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/projects/application/projects_service.dart';
import 'package:startupshub/src/projects/domain/projects_model.dart';

class ProjectsController extends StateNotifier<AsyncValue<Projects?>> {
  ProjectsController({required this.projectsService})
      : super(const AsyncData(null));

  final ProjectsService projectsService;

  void init() async {
    state = await AsyncValue.guard(() => projectsService.fetchProjects());
  }
}

final projectsNotifierProvider =
    StateNotifierProvider<ProjectsController, AsyncValue<Projects?>>((ref) {
  final ProjectsController controller =
      ProjectsController(projectsService: ref.watch(projectsServiceProvider));
  controller.init();
  return controller;
});
