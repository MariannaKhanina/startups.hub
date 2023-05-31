import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/projects/data/projects_api.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/projects/domain/projects_model.dart';

class ProjectsRepository {
  ProjectsRepository() {
    _api = ProjectsApi();
  }
  late ProjectsApi _api;

  Future<Projects> fetchProjects() async {
    final Map<String, dynamic> data = await _api.fetchProjects();
    final projectsFromJson = data["projects"];
    final List<Map<String, dynamic>> projectsList = List.from(projectsFromJson);

    final List<Project> list =
        projectsList.map((item) => Project.fromJson(item)).toList();
    return Projects(list: list);
  }
}

final projectsRepositoryProvider =
    Provider<ProjectsRepository>((ref) => ProjectsRepository());
