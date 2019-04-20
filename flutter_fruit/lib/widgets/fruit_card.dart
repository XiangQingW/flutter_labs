import 'package:flutter/widgets.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:flutter_fruit/styles.dart';

class FruitCard extends StatelessWidget {
  FruitCard(this.fruit, this.isInSeason);

  final Fruit fruit;

  final bool isInSeason;

  Widget _buildDetails() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color(0x40aa6d7c)),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              fruit.name,
              style: Styles.headlineText,
            ),
            Text(
              fruit.description,
              style: Styles.minorText,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        height: 350,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(fruit.imagePath), fit: BoxFit.cover)),
      ),
      Positioned(right: 0.0, left: 0.0, bottom: 0.0, child: _buildDetails())
    ]);
  }
}
