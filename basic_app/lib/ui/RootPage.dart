import 'package:basic_app/di/modules/AuthModule.dart';
import 'package:basic_app/logic/auth/AuthStatus.dart';
import 'package:basic_app/logic/firebase/Authetication.dart';
import 'package:basic_app/ui/home/HomePage.dart';
import 'package:basic_app/ui/login/LoginSignupPage.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  final BaseAuth _auth = AuthModule().get<BaseAuth>();

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  String _userId;
  AuthStatus authStatus;

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.LOGGED_OUT:
        return new LoginSignupPage(
          loginCallback: loginCallback,
          loggedOutUseCallback: loggedOutUseCallback,
        );
        break;
      case AuthStatus.LOGGED_OUT_USE:
      case AuthStatus.LOGGED_IN:
        return new HomePage(userId: _userId, logoutCallback: logoutCallback);
        break;
      default:
        return buildWaitingScreen();
    }
  }

  @override
  void initState() {
    super.initState();
    widget._auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.LOGGED_OUT : AuthStatus.LOGGED_IN;
      });
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  void loginCallback() {
    widget._auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void loggedOutUseCallback() {
    setState(() {
      _userId = "";
      authStatus = AuthStatus.LOGGED_OUT_USE;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.LOGGED_OUT;
      _userId = "";
    });
  }
}
