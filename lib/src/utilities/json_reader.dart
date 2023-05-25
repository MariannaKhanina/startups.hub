import 'dart:convert';

import 'package:flutter/services.dart';

class JsonReader {
  static Future<Map<String, dynamic>> readJson(String path) async {
    final String response = await rootBundle.loadString(path);

    return await jsonDecode(response);
  }
}
