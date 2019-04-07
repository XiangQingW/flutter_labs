import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.red),
      home: RandomWord()
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordState();
  }
}

class RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final _savedPairs = Set<WordPair>();

  Widget _buildRow(WordPair pair) {
    var isSaved = _savedPairs.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase),
      leading: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null
      ),
      onTap: () {
        setState(() {
          if (isSaved) {
            _savedPairs.remove(pair);
          } else {
            _savedPairs.add(pair);
          }
        });
      },
    );
  }

  Widget _get_suggestions() {
    return ListView.builder(itemBuilder: (BuildContext _context, int idx) {
      if (idx.isOdd) {
        return Divider();
      }
      
      var i = idx ~/ 2;
      if (i >= _suggestions.length)  {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      return _buildRow(_suggestions[i]);
    });
  }

  void _onPress() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final tiles = _savedPairs.map((WordPair pair) {
        return ListTile(title: Text(pair.asPascalCase));
      }).toList();

      final divided = ListTile.divideTiles(tiles: tiles, context: context).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text("saved"),
        ),
        body: ListView(children: divided)
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("app bar"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _onPress,)
        ],
      ),
      body: _get_suggestions()
    );
  }
}

