import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/styles.dart';

class FrostedBox extends StatelessWidget {
  const FrostedBox({this.child, Key key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Styles.frostedBackground),
        child: child,
      ),
    );
  }
}

class CloseButton extends StatefulWidget {
  final VoidCallback onPressed;

  const CloseButton(this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return CloseButtonState();
  }
}

class CloseButtonState extends State<CloseButton> {
  bool tapInProgress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          tapInProgress = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          tapInProgress = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          tapInProgress = false;
        });
      },
      child: ClipOval(
        child: FrostedBox(
            child: Container(
          width: 30,
          height: 30,
//          decoration: BoxDecoration(
//            borderRadius: BorderRadius.circular(15),
//          ),
          child: Center(
            child: Icon(CupertinoIcons.clear_thick),
          ),
        )),
      ),
    );
  }
}
