import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_fruit/data/app_state.dart';
import 'package:flutter_fruit/widgets/close_button.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:flutter_fruit/styles.dart';
import 'package:flutter_fruit/widgets/trivia.dart';

class ServingInfoChart extends StatelessWidget {
  ServingInfoChart({this.fruit});

  final Fruit fruit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 16.0,),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
              padding: EdgeInsets.only(left: 9.0, bottom: 4.0),
            child: Text(
                'Serving info',
              style: Styles.detailsServingHeaderText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Styles.servingInfoBorderColor)
          ),
          padding: EdgeInsets.all(8.0),
          child: Table(
            children: [
              TableRow(
                children: [
                  TableCell(child: Text("Serving Size")),
                  TableCell(child: Text(
                      fruit.servingSize,
                      textAlign: TextAlign.end,
                  ),)
                ]
              )
            ],
          ),
        ),
      ],
    );
  }
}

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
              child: Image.asset(fruit.imageAssetPath, fit: BoxFit.cover)),
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
          Expanded(
            child: ListView(
              children: <Widget>[
                CupertinoSegmentedControl(
                    children: {0: Text('Facts & Info'), 1: Text('Trivia')},
                    groupValue: _viewIndex,
                    onValueChanged: (value) {
                      setState(() {
                        _viewIndex = value;
                      });
                    }),
                _viewIndex == 0 ? InfoView(id: widget.id) : TriviaView(id: widget.id),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InfoView extends StatelessWidget {
  InfoView({this.id});

  int id;

  @override
  Widget build(BuildContext context) {
    AppState appState =
        ScopedModel.of<AppState>(context, rebuildOnChange: true);
    Fruit fruit = appState.getFruit(id);

    List<Widget> columChildren = [];

    final seasonIcons = <Widget>[];
    for (Season season in fruit.seasons) {
      seasonIcons.addAll([
        SizedBox(width: 12.0),
        Padding(
          padding: Styles.seasonIconPadding[season],
          child: Icon(Styles.seasonIconData[season],
              semanticLabel: seasonNames[season],
              color: Styles.seasonColors[season]),
        )
      ]);
    }

    Widget firstLine = Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(fruit.category.toString()),
        Spacer(),
      ]..addAll(seasonIcons),
    );
    columChildren.add(firstLine);

    columChildren.add(SizedBox(height: 8.0));

    columChildren.add(Text(
      fruit.name,
      style: Styles.detailsTitleText,
    ));

    columChildren.add(SizedBox(
      height: 8.0,
    ));

    columChildren.add(Text(
      fruit.shortDescription,
      style: Styles.detailsDescriptionText,
    ));

    columChildren.add(SizedBox(
      height: 15,
    ));

    columChildren.add(ServingInfoChart(fruit: fruit,));

    columChildren.add(SizedBox(height: 24.0,));

    columChildren.add(
      Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          CupertinoSwitch(
            value: fruit.isFavorite,
            onChanged: (value) {
              appState.setFavorite(fruit.id, value);
            },
          ),
          SizedBox(width: 8.0,),
          Text('Save to Garden')
        ],
      )
    );

    return CupertinoPageScaffold(
        child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columChildren,
      ),
    ));
  }
}
