import 'package:app/App/Service/Api/Function/show_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScreenProfileUser extends StatelessWidget {
  const ScreenProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        returndataUserImage(),
      ]),
    );
  }
}
