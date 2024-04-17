// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:app/App/Model/post.dart';
import 'package:http/http.dart' as http;
import '../../../../util/Const/url.dart';

class GetDataPost {
  static getpost(id) {}

  static Future<List<Student>> getall_post_user(
      {required String id_user}) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}post/postsuser/$id_user'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> postList =
          data.map((json) => Student.fromJson(json)).toList();
      for (var element in postList) {
        print(element.name);
      }
      return postList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Student>> getall_post_Catigory({
    required String id_classa,
    required String wilaya,
  }) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}Student/lavel/$id_classa'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> postList =
          data.map((json) => Student.fromJson(json)).toList();
      return postList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Student>> getall_Student() async {
    final response = await http.get(Uri.parse('${UrlApp.host}Student/all'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)["Students"];
      List<Student> postList =
          data.map((json) => Student.fromJson(json)).toList();
      return postList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Student>> getall_post_Catigory_profile({
    required String id_catigory,
    required String wilaya,
    required String idpost,
  }) async {
    final response = await http.get(Uri.parse(
        '${UrlApp.host}post/catigory/idcatigory=$id_catigory/$wilaya/postid=$idpost'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Student> postList =
          data.map((json) => Student.fromJson(json)).toList();
      return postList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
