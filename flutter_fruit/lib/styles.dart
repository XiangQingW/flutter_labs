import 'package:flutter/widgets.dart';

abstract class Styles {
  static const appBackground = Color(0xffd0d0d0);

  static const minorText = TextStyle(
    color: Color.fromRGBO(128, 128, 128, 1.0),
    fontFamily: 'NotoSans',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal
  );

  static const headlineText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.8),
    fontFamily: 'NotoSans',
    fontSize: 32.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold
  );
}