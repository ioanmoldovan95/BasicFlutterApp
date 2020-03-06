import 'package:basic_app/di/modules/AuthModule.dart';
import 'package:basic_app/logic/firebase/Authetication.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({this.userId, this.logoutCallback});

  final BaseAuth auth = AuthModule().get<BaseAuth>();
  final String userId;
  final VoidCallback logoutCallback;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter login demo"),
      ),
      body: new Center(
        child: new Text(
          "Main page for user $userId",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
