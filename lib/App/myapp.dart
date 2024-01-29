import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/util/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: light,
      home: ScreenSignin(),
    );
  }
}
