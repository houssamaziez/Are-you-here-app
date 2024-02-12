import 'package:app/App/Controller/homeController.dart';
import 'package:app/App/Controller/myappcontroller.dart';
import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/PostFunction/getdata.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/myapp.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiOperation()),
        ChangeNotifierProvider(create: (_) => MyAppController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: const MyApp(),
    ),
  );
}
