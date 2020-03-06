import 'package:basic_app/di/modules/MainModule.dart';
import 'package:basic_app/ui/login/LoginSignupPage.dart';
import 'package:basic_app/ui/RootPage.dart';
import 'package:flutter/material.dart';

import 'logic/firebase/Authetication.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  final MainModule mainModule = MainModule();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage()
    );
  }
}