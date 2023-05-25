import 'package:startupshub/src/projects/project_model.dart';

class ProjectsApi {
  List<Project> fetchProjects() {
    return List.generate(
      20,
      (index) => Project(
        id: 'project$index',
        name: 'Проект ${index + 1}',
        skills: ['html', 'css', 'js'],
        description: 'Краткое описание проекта',
      ),
    );
  }
}
