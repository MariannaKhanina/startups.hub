import 'package:startupshub/src/project/domain/project_model.dart';

class Projects {
  Projects({
    required this.list,
  });

  final List<Project> list;

  List<Project> getProjectsByIds(List<String> projectsIds) {
    if (list.isEmpty) return [];
    return list.where((project) => projectsIds.contains(project.id)).toList();
  }
}
