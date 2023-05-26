import 'package:flutter/material.dart';
import 'package:startupshub/src/projects/data/projects_repository.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/projects/presentation/projects_list.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  late Future<List<Project>> _futureProjects;

  @override
  void initState() {
    final ProjectsRepository repository = ProjectsRepository();

    _futureProjects = repository.getProjects();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget body = FutureBuilder<List<Project>>(
      future: _futureProjects,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProjectsList(
            projectsData: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Проекты'),
      ),
      body: body,
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
