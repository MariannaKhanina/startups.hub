import 'package:startupshub/src/utilities/json_reader.dart';

class ProjectsApi {
  Future<Map<String, dynamic>> fetchProjects() async {
    return await JsonReader.readJson('assets/data/projects.json');
  }
}
