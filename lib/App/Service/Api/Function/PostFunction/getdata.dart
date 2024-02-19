// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:http/http.dart' as http;
import '../../../../util/Const/url.dart';

class GetDataPost {
  static getpost(id) {}

  static Future<List<Post>> getall_post_user({required String id_user}) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}post/postsuser/$id_user'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Post> postList = data.map((json) => Post.fromJson(json)).toList();
      postList.forEach((element) {
        print(element.title);
      });
      return postList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Post>> getall_post_Catigory(
      {required String id_catigory}) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}post/catigory/$id_catigory'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Post> postList = data.map((json) => Post.fromJson(json)).toList();

      return postList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
