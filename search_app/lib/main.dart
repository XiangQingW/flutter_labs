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
      home: MySearchBar()
    );
  }
}

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("search app"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchBarDelegate());
              },
            )
          ],
        ),
      );
  }
}

class SearchBarDelegate extends SearchDelegate<String> {
  final targets = <String>["12", "13", "14", "21", "22", "23"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
        child: Center(
          child: Text(query),
        )
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty ? [] : targets.where((t) => t.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = suggestion[index];
            showResults(context);
          },
          title: RichText(
              text: TextSpan(
                text: suggestion[index].substring(0, query.length),
                style: TextStyle(color: Colors.red),
                children: <TextSpan>[
                  TextSpan(
                    text: suggestion[index].substring(query.length),
                    style: TextStyle(color: Colors.green)
                  )
                ]
              ),
          )
        );
    });
  }
}
