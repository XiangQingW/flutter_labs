import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_fruit/data/app_state.dart';
import 'package:flutter_fruit/widgets/close_button.dart';

class DetailsScreen extends StatefulWidget {
  final int id;

  DetailsScreen({this.id});

  @override
  State<StatefulWidget> createState() {
    return DetailsScreenState();
  }
}

class DetailsScreenState extends State<DetailsScreen> {
  int _viewIndex = 0;

  Widget _buildHeader(BuildContext context, AppState modle) {
    final fruit = modle.getFruit(widget.id);
    
    return SizedBox(
      height: 150.0, 
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 0.0,
            left: 0.0,
            child: Image.asset(fruit.imageAssetPath, fit: BoxFit.cover)
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            child: SafeArea(child: CloseButton(() {
              Navigator.of(context).pop();
            })),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context, appState),
        ],
      ),
    );
  }
}
