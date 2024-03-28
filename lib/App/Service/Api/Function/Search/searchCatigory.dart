import 'dart:convert';

import 'package:app/App/Model/catigory.dart';
import 'package:app/App/util/Const/url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Catigorys>> search(
  BuildContext context,
  String query,
) async {
  final response;
  try {
    if (query.isEmpty || query == "") {
      response = await http.get(
        Uri.parse('${UrlApp.host}catigory/search/keyword=all'),
      );
    } else {
      response = await http.get(
        Uri.parse('${UrlApp.host}catigory/search/keyword=$query'),
      );
    }

    if (response.statusCode == 200) {
      List<dynamic> list = json.decode(response.body);
      List<Catigorys> listcatigorys =
          list.map((json) => Catigorys.fromJson(json)).toList();
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
