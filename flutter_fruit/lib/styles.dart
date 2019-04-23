import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  static const Color settingsLineation = Color(0xffbcbbc1);

  static const frostedBackground = Color(0xccf8f8f8);

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

  static const servingInfoBorderColor = Color(0xffb0b0b0);

  static const seasonIconPadding = {
    Season.winter: const EdgeInsets.only(right: 0.0),
    Season.spring: const EdgeInsets.only(right: 4.0),
    Season.summer: const EdgeInsets.only(right: 6.0),
    Season.autumn: const EdgeInsets.only(right: 0.0),
  };

  static const seasonIconData = {
    Season.winter: FontAwesomeIcons.snowflake,
    Season.spring: FontAwesomeIcons.leaf,
    Season.summer: FontAwesomeIcons.umbrellaBeach,
    Season.autumn: FontAwesomeIcons.canadianMapleLeaf,
  };

  static const seasonColors = <Season, Color>{
    Season.winter: Color(0xff336dcc),
    Season.spring: Color(0xff2fa02b),
    Season.summer: Color(0xff287213),
    Season.autumn: Color(0xff724913),
  };

  static const detailsTitleText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 30.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const detailsDescriptionText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 0.9),
    fontFamily: 'NotoSans',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const detailsServingHeaderText = TextStyle(
    color: Color.fromRGBO(176, 176, 176, 1.0),
    fontFamily: 'NotoSans',
    fontSize: 16.0,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );
}