import 'package:flutter/material.dart';

import 'dart:async';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = <bool>[];

  @override
  void initState() {
    for (var i = 0; i < 10; i++) {
      list.add(false);
    }
    super.initState();
  }

  _expansionCb(int index, bool isOpen) {
    setState(() {
      list[index] = !isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: SingleChildScrollView(
                child: ExpansionPanelList(
                    expansionCallback: (index, isOpen) {
                      _expansionCb(index, isOpen);
                    },
                    children: list.map((isOpen) {
                      return ExpansionPanel(
                          isExpanded: isOpen,
                          headerBuilder: (context, isOpen) {
                            return ListTile(
                              title: Text("hello"),
                            );
                          },
                          body: ListTile(title: Text("world")));
                    }).toList()))),
        onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("exit?"),
          actions: <Widget>[
            FlatButton(onPressed: () => Navigator.pop(context, false), child: Text("No")),
            FlatButton(onPressed: () => Navigator.pop(context, true), child: Text("Yes")),
          ],
        ),
    );
  }

}
