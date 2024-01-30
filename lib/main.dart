import 'package:app/App/Service/Api/api_operations.dart';
import 'package:app/App/Service/settings.dart';
import 'package:app/App/myapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await Settings.inst();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiOperation()),
      ],
      child: const MyApp(),
    ),
  );
}
