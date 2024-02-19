import 'dart:convert';
import 'package:app/App/util/Const/url.dart';
import 'package:http/http.dart' as http;

class ApiDelete {
  static Future<void> deleteData(String id) async {
    final String apiUrl = '${UrlApp.host}post/delete/$id';

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Add any other headers as needed
        },
      );

      if (response.statusCode == 200) {
        print('DELETE request successful');
      } else {
        print('Failed to delete data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error while deleting data: $error');
    }
  }
}
