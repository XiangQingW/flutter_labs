import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter_fruit/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      color: Styles.appBackground,
      home: HomeScreen(),
    );
  }
}

