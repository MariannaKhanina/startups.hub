import 'package:startupshub/src/entity_model.dart';
import 'package:startupshub/src/project/domain/project_model.dart';

class Person implements Entity {
  Person({
    required this.id,
    required this.name,
    required this.skills,
    this.description,
    this.projectsIds = const <String>[],
  });
  @override
  final String id;
  @override
  final String name;
  @override
  final List<String> skills;
  @override
  final String? description;
  final List<String> projectsIds;
  List<Project> projects = [];

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      skills: Entity.parseSkills(json['skills']),
      description: json['description'],
      projectsIds: Entity.parseIds(json['projects']),
    );
  }
}
