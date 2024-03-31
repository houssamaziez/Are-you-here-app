import 'dart:convert';

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/Model/post.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> searchpost(
  BuildContext context,
  String query,
) async {
  final response;
  try {
    if (query.isEmpty || query == "") {
      response = await http.get(
        Uri.parse('${UrlApp.host}post/search/keyword=all'),
      );
    } else {
      response = await http.get(
        Uri.parse('${UrlApp.host}post/search/keyword=$query'),
      );
    }

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<Post> listcatigorys =
          list.map((json) => Post.fromJson(json)).toList();
      return listcatigorys;
    } else {
      throw Exception('Failed to load search results');
    }
  } catch (e) {
    print('Error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Failed to load search results. Please try again.'),
        backgroundColor: Colors.red,
      ),
    );
    throw Exception('Failed to load search results. Please try again.');
  }
}
