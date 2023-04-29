import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCalling {
  static Future<Map> page1Api() async {
    final response = await http.get(Uri.parse(
        'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  }

  static Future<Map> page2Api(String id) async {
    final response = await http.get(Uri.parse(
        'https://8b648f3c-b624-4ceb-9e7b-8028b7df0ad0.mock.pstmn.io/dishes/v1/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {};
    }
  }
}
