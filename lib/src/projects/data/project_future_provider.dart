import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/project/domain/project_model.dart';
import 'package:startupshub/src/projects/data/projects_repository.dart';

final projectsFutureProvider = FutureProvider<List<Project>>((ref) async {
  final ProjectsRepository repository = ref.read(projectsRepositoryProvider);

  return await repository.getProjects();
});
