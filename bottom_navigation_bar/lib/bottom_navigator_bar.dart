import "package:flutter/material.dart";

class NavigatorBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigatorBarState();
  }
}

class NavigatorBarState extends State<NavigatorBar> {
  final bars = <Widget>[];
  var _curIdx = 0;

  @override
  void initState() {
    bars..add(Home())..add(Search())..add(Email());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bars[_curIdx],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("HOME")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("SEARCH")),
          BottomNavigationBarItem(
              icon: Icon(Icons.email), title: Text("EMAIL")),
        ],
        currentIndex: _curIdx,
        onTap: (int index) {
          setState(() {
            _curIdx = index;
          });
        },
        type: BottomNavigationBarType.fixed
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Text("home"),
        ));
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: Center(
          child: Text("search"),
        ));
  }
}

class Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Email"),
        ),
        body: Center(
          child: Text("email"),
        ));
  }
}
