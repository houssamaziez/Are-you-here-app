// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:http/http.dart' as http;
import '../../../../util/Const/url.dart';

class GetDataPost {
  static Future<List<Catigory>> getallCatigorys() async {
    final _response = await http.get(Uri.parse('${UrlApp.host}catigory'));
    List<dynamic> list = json.decode(_response.body)["Catigory"];
    List<Catigory> listcatigorys =
        list.map((json) => Catigory.fromJson(json)).toList();
    listcatigorys.forEach((element) {
      print(element);
    });
    return listcatigorys;
  }

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

  static Future<List<Post>> getall_post_catigory(
      {required String id_user}) async {
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
}
