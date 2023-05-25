import 'package:startupshub/src/utilities/json_reader.dart';

class PeopleApi {
  Future<Map<String, dynamic>> fetchPeople() async {
    return await JsonReader.readJson('assets/data/people.json');
  }
}
