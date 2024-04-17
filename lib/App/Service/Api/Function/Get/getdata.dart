import 'dart:convert';

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:http/http.dart' as http;

import '../../../../Model/classa.dart';

class GetData {
  static Future<List<Lavle>> getallLevel() async {
    final response = await http.get(Uri.parse('${UrlApp.host}lavel/all'));
    List<dynamic> list = json.decode(response.body)["lavels"];
    List<Lavle> listcatigorys =
        list.map((json) => Lavle.fromJson(json)).toList();

    return listcatigorys;
  }

  static Future<void> updateiseeNotification(id) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}Notisfication/editsee/$id'));
  }

  static Future<List<Classa>> getallclassa(id) async {
    final response = await http.get(Uri.parse('${UrlApp.host}classa/all/$id'));
    List<dynamic> list = json.decode(response.body)["lavels"];
    print(list);

    List<Classa> listcatigorys =
        list.map((json) => Classa.fromJson(json)).toList();
    return listcatigorys;
  }

  static Future<Student> getpost(iduser) async {
    final response =
        await http.get(Uri.parse('${UrlApp.host}post/data/$iduser'));
    Student list = Student.fromJson(json.decode(response.body)["post"]);

    return list;
  }

  static Future<Student> getpostbyid(id) async {
    final response = await http.get(Uri.parse('${UrlApp.host}post/show/22'));
    Student list = Student.fromJson(json.decode(response.body));

    return list;
  }
}
