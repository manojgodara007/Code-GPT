import 'package:end_gam/colour.dart';
import 'package:end_gam/home_page.dart';
import 'package:flutter/material.dart';

import 'api_key.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var id = Api.generateTxet(
        "breast cancer detection using deep learning python code");
    print(id);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      title: 'Code GPT',
      theme: ThemeData(
          fontFamily: 'Basics',
          scaffoldBackgroundColor: bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )), // AppBarTheme // ThemeData
    ); // MaterialApp
  }
}
