import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
  List<String> url;
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    url = <String>[];
    _controller = ScrollController();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent)  {
        fetchTen();
      }
    });

    fetchTen();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("pull load more"),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              url.clear();
              await fetchTen();
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                    child: Image.network(url[index], fit: BoxFit.cover));
              },
              itemCount: url.length,
              controller: _controller,
            )));
  }

  fetch() async {
    final resp = await http.get("http://dog.ceo/api/breeds/image/random");
    if (resp.statusCode == 200) {
      setState(() {
        url.add(json.decode(resp.body)['message']);
      });
    }
  }

  fetchTen() async {
    for (int i = 0; i < 10; i++) {
      await fetch();
    }
  }
}
