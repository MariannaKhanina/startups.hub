import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/common_widgets/custom_progress_indicator.dart';
import 'package:startupshub/src/projects/domain/projects_model.dart';
import 'package:startupshub/src/projects/presentation/projects_list.dart';
import 'package:startupshub/src/projects/presentation/projects_controller.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Projects?> asyncProjectsData =
        ref.watch(projectsNotifierProvider);

    final Widget body = asyncProjectsData.when(
      data: (data) => ProjectsList(
        projectsData: data!.list,
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
