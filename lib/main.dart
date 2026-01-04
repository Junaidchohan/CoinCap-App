import 'dart:convert';

import 'package:coincap_app/Pages/home_page.dart';
import 'package:coincap_app/models/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadConfig();
  runApp(const MyApp());
}

Future<void> _loadConfig() async {
  String _configContent = await rootBundle.loadString(
    "assets\config\main.json",
  );
  Map _configData = jsonDecode(_configContent);
  GetIt.instance.registerSingleton<AppConfig>(
    AppConfig(COIN_API_BASE_URL: _configData["COIN_API_BASE_URL"]),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromRGBO(25, 58, 206, 1),
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
