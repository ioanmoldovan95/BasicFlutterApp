import 'package:basic_app/ui/login/login_signup_page.dart';
import 'package:basic_app/ui/root_page.dart';
import 'package:flutter/material.dart';

import 'logic/firebase/authetication.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth())
    );
  }
}