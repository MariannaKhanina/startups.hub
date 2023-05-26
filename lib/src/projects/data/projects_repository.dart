import 'package:startupshub/src/projects/data/projects_api.dart';
import 'package:startupshub/src/project/domain/project_model.dart';

class ProjectsRepository {
  ProjectsRepository() {
    _api = ProjectsApi();
  }
  late ProjectsApi _api;

  Future<List<Project>> getProjects() async {
    final Map<String, dynamic> data = await _api.fetchProjects();
    final projectsFromJson = data["projects"];
    final List<Map<String, dynamic>> projectsList = List.from(projectsFromJson);

    return projectsList.map((item) => Project.fromJson(item)).toList();
  }
}
