import 'package:flutter/cupertino.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter_fruit/screens/home.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_fruit/data/app_state.dart';

void main() {
  runApp(
    ScopedModel<AppState>(
      model: AppState(),
      child: CupertinoApp(
        title: "fruit demo",
        color: Styles.appBackground,
        home: HomeScreen(),
      ),
    )
  );
}

