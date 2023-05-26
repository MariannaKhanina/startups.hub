import 'package:startupshub/src/entity_model.dart';

class Project implements Entity {
  Project({
    required this.id,
    required this.name,
    required this.skills,
    this.description,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final List<String> skills;
  @override
  final String? description;

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      name: json['name'],
      skills: Entity.parseSkills(json['skills']),
      description: json['description'],
    );
  }
}
