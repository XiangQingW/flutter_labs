import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/data/app_state.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  AppState appState;

  Widget _buildItem(Fruit fruit) {
    List<Widget> rows = [];

    rows.add(DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: AssetImage(fruit.imageAssetPath), fit: BoxFit.cover)),
      child: SizedBox(
        height: 100.0,
        width: 100.0,
      ),
    ));

    rows.add(SizedBox(width: 10.0,));

    rows.add(Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 10.0,),
          Text("${fruit.name}"),
          SizedBox(height: 10.0,),
          Text(
            "${fruit.shortDescription}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          )
        ],
      ),
    ));

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: rows,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);
    List<Fruit> all_fruits = appState.allFruits;

    return CupertinoPageScaffold(
        child: SafeArea(
            child: ListView.builder(
      itemBuilder: (context, index) {
        return _buildItem(all_fruits[index]);
      },
      itemCount: all_fruits.length,
    )));
  }
}
