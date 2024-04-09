import 'dart:convert';

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:http/http.dart' as http;

class GetData {
  static Future<List<Catigorys>> getallCatigorys() async {
    final response = await http.get(Uri.parse('${UrlApp.host}catigory'));
    List<dynamic> list = json.decode(response.body)["Catigory"];
    List<Catigorys> listcatigorys =
        list.map((json) => Catigorys.fromJson(json)).toList();

    return listcatigorys;
  }

  static Future<Post> getpost(iduser) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}post/data/$iduser'));
    Post list = Post.fromJson(json.decode(response.body)["post"]);

    return list;
  }

  static Future<Post> getpostbyid(id) async {
    final response = await http.get(Uri.parse('${UrlApp.host}post/show/22'));
    Post list = Post.fromJson(json.decode(response.body));

    return list;
  }
}
