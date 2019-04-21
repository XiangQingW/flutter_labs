import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:flutter_fruit/data/app_state.dart';
import 'package:flutter_fruit/widgets/fruit_card.dart';
import 'package:scoped_model/scoped_model.dart';

class ListScreen extends StatelessWidget {
  List<Widget> _genFruitRows(List<Fruit> fruits, {bool inSeason = true}) {
    final cards = <Widget>[];

    for (Fruit fruit in fruits) {
      cards.add(Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 24.0),
          child: FruitCard(fruit, inSeason)));
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        final rows = <Widget>[];

        var dateString = DateFormat("MMMM y").format(DateTime.now());

        rows.add(Padding(
            padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(dateString, style: Styles.minorText),
                Text(
                  "In season today",
                  style: Styles.headlineText,
                )
              ],
            )));

        final appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);
        rows.addAll(_genFruitRows(appState.allFruits));

        return DecoratedBox(
            decoration: BoxDecoration(color: Color(0xffffffff)),
            child: ListView(
              children: rows,
            ));
      },
    );
  }
}
