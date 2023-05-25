abstract class Entity {
  Entity({
    required this.id,
    required this.name,
    required this.skills,
    this.description,
  });

  final String id;
  final String name;
  final List<String> skills;
  final String? description;
}
