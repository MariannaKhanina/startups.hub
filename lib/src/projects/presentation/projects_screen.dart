import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/common_widgets/custom_progress_indicator.dart';
import 'package:startupshub/src/projects/data/project_future_provider.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/projects/presentation/projects_list.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Project>> asyncProjectsData =
        ref.watch(projectsFutureProvider);

    final Widget body = asyncProjectsData.when(
      data: (data) => ProjectsList(
        projectsData: data,
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CustomProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Проекты'),
      ),
      body: body,
    );
  }
}
