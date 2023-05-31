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

  static List<String> parseSkills(List<dynamic> json) {
    return List.from(json).map((item) => item as String).toList();
  }

  static List<String> parseIds(List<dynamic> json) {
    return List.from(json).map((item) => item as String).toList();
  }
}
