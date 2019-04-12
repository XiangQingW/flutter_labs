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
      home: WrapDemo(),
    );
  }
}

class WrapDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WrapState();
  }
}

class WrapState extends State<WrapDemo> {
  final list = <Widget>[];

  @override
  void initState() {
    list.add(buidAddButton());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: Container(
        width: width,
        height: height / 2,
        color: Colors.grey,
        child: Wrap(
          children: list,
          spacing: 26,
          crossAxisAlignment: WrapCrossAlignment.center
        ),
      )),
    );
  }

  Widget buidAddButton() {
    return GestureDetector(
      onTap: () {
        if (9 <= list.length) {
          return;
        }

        list.insert(list.length - 1, buildPicture());
        setState(() {
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.green,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPicture() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: (100 - list.length * 8).toDouble(),
        width: 100,
        color: Colors.blue,
        child: Center(
          child: Text("照片"),
        ),
      ),
    );
  }
}
