import 'package:flutter/material.dart';
import 'package:startupshub/src/common_widgets/skills.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/project/presentation/project_screen.dart';

class ProjectsListItem extends StatelessWidget {
  const ProjectsListItem({
    super.key,
    required this.projectData,
  });

  final Project projectData;

  @override
  Widget build(BuildContext context) {
    final String name = projectData.name;
    final List<String> skills = projectData.skills;

    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Skills(
          skillsData: skills,
        ),
        leading: const CircleAvatar(
          child: Icon(Icons.art_track_outlined),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProjectScreen(
              projectData: projectData,
            ),
          ));
        },
      ),
    );
  }
}
