import 'package:flutter/material.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/common_widgets/skills.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    super.key,
    required this.projectData,
  });
  final Project projectData;

  @override
  Widget build(BuildContext context) {
    final String name = projectData.name;
    final List<String> skills = projectData.skills;
    final String? description = projectData.description;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50),
          child: Center(
            child: Text(name),
          ),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const CircleAvatar(
                minRadius: 30,
                child: Icon(
                  Icons.art_track_outlined,
                  size: 50,
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                  ),
                  child: Skills(
                    skillsData: skills,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
              if (description != null) Text(description),
            ],
          ),
        ),
      ),
    );
  }
}
