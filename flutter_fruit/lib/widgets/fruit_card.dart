import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter_fruit/screens/details.dart';

class PressableCard extends StatefulWidget {
  const PressableCard(
      {@required this.child,
      this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
      this.upElevation = 2.0,
      this.downElevation = 0.0,
      this.shadowColor = CupertinoColors.black,
      this.duration = const Duration(milliseconds: 100),
      this.onPressed,
      Key key})
      : super(key: key);

  final VoidCallback onPressed;

  final Widget child;

  final BorderRadius borderRadius;

  final double upElevation;

  final double downElevation;

  final Color shadowColor;

  final Duration duration;

  @override
  State<StatefulWidget> createState() {
    return _PressableCardState();
  }
}

class _PressableCardState extends State<PressableCard> {
  bool cardIsDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cardIsDown = false;
        });
        if (widget.onPressed != null) {
          widget.onPressed();
        }
      },
      onTapDown: (details) => setState(() => cardIsDown = true),
      onTapCancel: () => setState(() => cardIsDown = false),
      child: AnimatedPhysicalModel(
          child: ClipRRect(
            borderRadius: widget.borderRadius,
            child: widget.child,
          ),
          borderRadius: widget.borderRadius,
          shape: BoxShape.rectangle,
          elevation: cardIsDown ? widget.downElevation : widget.upElevation,
          color: CupertinoColors.lightBackgroundGray,
          shadowColor: widget.shadowColor,
          duration: widget.duration),
    );
  }
}

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
              fruit.shortDescription,
              style: Styles.minorText,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PressableCard(
      onPressed: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) {
              return CupertinoPageScaffold(child: DetailsScreen(id: fruit.id));
            },
            fullscreenDialog: true));
      },
      child: Stack(children: <Widget>[
        Container(
          height: 350,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(fruit.imageAssetPath), fit: BoxFit.cover)),
        ),
        Positioned(right: 0.0, left: 0.0, bottom: 0.0, child: _buildDetails())
      ]),
    );
  }
}
