import 'package:flutter/material.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/projects/presentation/projects_list_item.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({
    super.key,
    required this.projectsData,
  });
  final List<Project> projectsData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projectsData.length,
      itemBuilder: (context, index) {
        final Project project = projectsData[index];
        return ProjectsListItem(
          projectData: project,
        );
      },
    );
  }
}
