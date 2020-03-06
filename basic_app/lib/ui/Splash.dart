import 'package:basic_app/di/modules/AuthModule.dart';
import 'package:basic_app/logic/firebase/Authetication.dart';
import 'package:basic_app/ui/home/HomePage.dart';
import 'package:basic_app/ui/login/LoginSignupPage.dart';
import 'package:flutter/material.dart';

enum AuthStatus { NOT_DETERMINED, LOGGED_OUT, LOGGED_IN }

class Splash extends StatefulWidget {
  final BaseAuth _auth = AuthModule().get<BaseAuth>();

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
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
        );
        break;
      case AuthStatus.LOGGED_IN:
        if(_userId != null && _userId.isNotEmpty){
          return new HomePage(
            userId: _userId,
            logoutCallback: logoutCallback,
          );
        } else {
          return buildWaitingScreen();
        }
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

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.LOGGED_OUT;
      _userId = "";
    });
  }
}
