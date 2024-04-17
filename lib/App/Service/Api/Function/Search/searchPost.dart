import 'dart:convert';

import 'package:app/App/Model/Parent.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Parent>> searchpost(
  BuildContext context,
  String query,
) async {
  final http.Response response;
  try {
    if (query.isEmpty || query == "alllllllllllllllll") {
      response = await http.get(
        Uri.parse('${UrlApp.host}users/search/keyword=alllllllllllllllll'),
      );
    } else {
      response = await http.get(
        Uri.parse('${UrlApp.host}users/search/keyword=$query'),
      );
    }

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<Parent> listcatigorys =
          list.map((json) => Parent.fromJson(json)).toList();
      return listcatigorys;
    } else {
      throw Exception('Failed to load search results');
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Failed to load search results. Please try again.'),
        backgroundColor: Colors.red,
      ),
    );
    throw Exception('Failed to load search results. Please try again.');
  }
}
