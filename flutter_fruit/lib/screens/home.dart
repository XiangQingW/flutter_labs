import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_fruit/screens/list.dart';
import 'package:flutter_fruit/screens/setting.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(tabBar: CupertinoTabBar(items: [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text("Home")
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book),
        title: Text("My Garden")
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        title: Text("Search"),
      ),
      BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.settings),
        title: Text("Settings")
      )
    ]),
        tabBuilder: (context, index) {
          if (index == 0) {
            return ListScreen();
          } else if (index == 1) {
            return null;
          } else if (index == 2) {
            return null;
          }
          return SettingScreen();
        });
  }
}

