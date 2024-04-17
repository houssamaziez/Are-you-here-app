import 'package:flutter/material.dart';

snackBar(context, {required String message, Color color = Colors.red}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(child: Text(message)),
    backgroundColor: color,
  ));
}
