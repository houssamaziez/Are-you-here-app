import 'dart:convert';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:http/http.dart' as http;

import 'package:app/App/util/Const/url.dart';

import '../../../../Model/note.dart';
import '../../../../Model/notification.dart';

Future<List<Notificationapp>> getallNotification() async {
  final response = await http.get(
      Uri.parse('${UrlApp.host}Notisfication/iduser/${userid.read('iduser')}'));
  List<dynamic> list = json.decode(response.body)["notification"];
  List<Notificationapp> listcatigorys =
      list.map((json) => Notificationapp.fromJson(json)).toList();

  return listcatigorys;
}

Future<List<Note>> getallNote(id, userid) async {
  final response = await http.get(Uri.parse(
      '${UrlApp.host}note/notification_id=${id}/user_id=3/usersend_id=3'));
  List<dynamic> list = json.decode(response.body);
  List<Note> listcatigorys = list.map((json) => Note.fromJson(json)).toList();

  return listcatigorys;
}
