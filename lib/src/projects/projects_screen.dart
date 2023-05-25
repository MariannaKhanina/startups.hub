import 'package:flutter/material.dart';
import 'package:startupshub/src/projects/project_model.dart';
import 'package:startupshub/src/projects/projects_api.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late List<Project> _projectsData;

  @override
  void initState() {
    final ProjectsApi projectsApi = ProjectsApi();

    _projectsData = projectsApi.fetchProjects();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Проекты'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _projectsData.length,
              itemBuilder: (context, index) {
                final Project project = _projectsData[index];
                return ProjectTile(
                  title: project.name,
                  skills: project.skills,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.title,
    required this.skills,
  });
  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Row(
        children: skills.map((skill) => Text('#$skill')).toList(),
      ),
      leading: const Icon(Icons.art_track_outlined),
      onTap: () {
        throw UnimplementedError();
      },
    );
  }
}
