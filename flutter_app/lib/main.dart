import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(myApp());

class RandomWordsState extends State<RandomWord> {
  var _suggestions = <WordPair>[];

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (BuildContext contest, int i) {
      if (i.isOdd) {
        return new Divider();
      }

      var idx = i ~/ 2;
      if (idx >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      print('haha ${idx} len: ${_suggestions.length}');

      return _buildRow(_suggestions[idx]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile (
      title: Text(
        pair.asPascalCase
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("list view"),
      ),
      body: _buildSuggestions()
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "hello world",
      home: new RandomWord(),
    );
  }
}
