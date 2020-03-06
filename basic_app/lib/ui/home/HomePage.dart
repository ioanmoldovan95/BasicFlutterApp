import 'package:basic_app/di/modules/AuthModule.dart';
import 'package:basic_app/logic/firebase/Authetication.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({this.userId, this.logoutCallback});

  final String userId;
  final VoidCallback logoutCallback;

  @override
  HomePageState createState() =>
      new HomePageState(userId: userId, logoutCallback: logoutCallback);
}

class HomePageState extends State<HomePage> {
  HomePageState({this.userId, this.logoutCallback});

  final BaseAuth auth = AuthModule().get<BaseAuth>();
  final String userId;
  final VoidCallback logoutCallback;

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Flutter login demo"),
      ),
      body: showMainScreen(),
      bottomNavigationBar: showBottomNavBar(),
    );
  }

  Widget showMainScreen() {
    return new Center(
      child: new Text(
        "Main page for user $userId",
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  final TextStyle bottomNavBarIconTextStyle =
      new TextStyle(fontSize: 12, color: Colors.black45);
  final TextStyle bottomNavBarIconTextStyleSelected =
      new TextStyle(fontSize: 13, color: Colors.blue);

  Widget showBottomNavBar() {
    return new BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: _currIndex == 0 ? Colors.blue : Colors.black45,
            ),
            title: Text(
              "Map",
              style: _currIndex == 0
                  ? bottomNavBarIconTextStyleSelected
                  : bottomNavBarIconTextStyle,
            )),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.list,
              size: 30,
              color: _currIndex == 1 ? Colors.blue : Colors.black45,
            ),
            title: Text(
              "List",
              style: _currIndex == 1
                  ? bottomNavBarIconTextStyleSelected
                  : bottomNavBarIconTextStyle,
            )),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.update,
              size: 30,
              color: _currIndex == 2 ? Colors.blue : Colors.black45,
            ),
            title: Text(
              "Icon 3",
              style: _currIndex == 2
                  ? bottomNavBarIconTextStyleSelected
                  : bottomNavBarIconTextStyle,
            )),
        BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.account_circle,
              size: 30,
              color: _currIndex == 3 ? Colors.blue : Colors.black45,
            ),
            title: Text(
              "Profile",
              style: _currIndex == 3
                  ? bottomNavBarIconTextStyleSelected
                  : bottomNavBarIconTextStyle,
            )),
      ],
      onTap: (itemIndex) => onNavigationBarItemTapped(itemIndex),
      type: BottomNavigationBarType.fixed,
    );
  }

  void onNavigationBarItemTapped(int itemIndex) {
    print("Tapped nav bar item $itemIndex");
    setState(() {
      _currIndex = itemIndex;
    });
  }
}
