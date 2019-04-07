import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MyBottomAppBar());
  }
}

class MyBottomAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyBottomAppBarState();
  }
}

class MyBottomAppBarState extends State<MyBottomAppBar> {
  final _eachView = <Widget>[];
  var _curIdx = 0;

  @override
  void initState() {
    _eachView..add(EachView("page1"))..add(EachView("page2"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_curIdx],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EachView("New");
          }));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.near_me),
              onPressed: () {
                setState(() {
                  _curIdx = 0;
                });
              },
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(Icons.edit_location),
              onPressed: () {
                setState(() {
                  _curIdx = 1;
                });
              },
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);

  @override
  State<StatefulWidget> createState() {
    return EachViewState();
  }
}

class EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
    );
  }
}
