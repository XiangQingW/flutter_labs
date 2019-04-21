import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

abstract class Styles {
  static const appBackground = Color(0xffd0d0d0);

  static const scaffoldBackground = Color(0xfff0f0f0);

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

  static const settingsItemPressed = Color(0xffd9d9d9);

  static const transparentColor = Color(0x00000000);

  static const Color iconBlue = Color(0xff0000ff);

  static const Color iconGold = Color(0xffdba800);

  static const calorieIcon = IconData(
    0xf3bb,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );

  static const preferenceIcon = IconData(
    0xf443,
    fontFamily: CupertinoIcons.iconFont,
    fontPackage: CupertinoIcons.iconFontPackage,
  );
}