import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:startupshub/src/projects/data/projects_repository.dart';
import 'package:startupshub/src/projects/domain/projects_model.dart';

class ProjectsService {
  ProjectsService({
    required this.projectsRepository,
  });

  final ProjectsRepository projectsRepository;

  Future<Projects> fetchProjects() {
    return projectsRepository.fetchProjects();
  }
}

final projectsServiceProvider =
    Provider<ProjectsService>((ref) => ProjectsService(
          projectsRepository: ref.watch(projectsRepositoryProvider),
        ));
