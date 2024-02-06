import 'package:app/App/Controller/homeController.dart';
import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/Service/Api/Function/ping.dart';
import 'package:app/App/myapp.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:dart_ping/dart_ping.dart';

void main() async {
  await GetStorage.init();

  // PingApp.getping();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiOperation()),
        ChangeNotifierProvider(create: (_) => MyAppController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MyApp(),
    ),
  );
}
