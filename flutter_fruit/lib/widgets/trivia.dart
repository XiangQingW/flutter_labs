import 'package:flutter/widgets.dart';
import 'package:flutter_fruit/data/app_state.dart';
import 'package:flutter_fruit/data/fruit.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/cupertino.dart';

class TriviaView extends StatefulWidget {
  TriviaView({this.id});

  final int id;

  @override
  State<StatefulWidget> createState() {
    return TriviaState();
  }
}

enum ViewStatus { Question, Result, Final }

class TriviaState extends State<TriviaView> {
  Fruit fruit;
  int questionIndex = 0;
  ViewStatus viewStatus = ViewStatus.Question;
  int rightCount = 0;
  bool isPreRight = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final appState = ScopedModel.of<AppState>(context, rebuildOnChange: true);
    setState(() {
      fruit = appState.getFruit(widget.id);
    });
  }

  Widget _buildQuestionView() {
    final travial = fruit.trivia[questionIndex];

    final coloumnChildren = <Widget>[];
    coloumnChildren.add(Text(travial.question));

    for (int i = 0; i < travial.answers.length; i++) {
      coloumnChildren.add(SizedBox(
        height: 8.0,
      ));
      coloumnChildren.add(CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text(
            travial.answers[i],
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            setState(() {
              if (i == travial.correctAnswerIndex) {
                rightCount += 1;
                isPreRight = true;
              } else {
                isPreRight = false;
              }

              questionIndex += 1;

              if (questionIndex == fruit.trivia.length) {
                viewStatus = ViewStatus.Final;
              } else {
                viewStatus = ViewStatus.Result;
              }

            });
          }));
    }

    final questionView = Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: coloumnChildren,
      ),
    );

    return questionView;
  }

  Widget _buildResultView() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
            isPreRight == true ? Text(
                "You are right",
              textAlign: TextAlign.center,
            ) : Text(
                "You are wrong.",
              textAlign: TextAlign.center,
            ),
          CupertinoButton(child: Text("Next question!"), onPressed: () {
            setState(() {
              viewStatus = ViewStatus.Question;
            });
          })
        ],
      ),
    );
  }

  Widget _buildFinalView() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "All done",
            textAlign: TextAlign.center,
          ),
          Text(
            "$rightCount of ${fruit.trivia.length}.",
            textAlign: TextAlign.center,
          ),
          CupertinoButton(child: Text("try again!"), onPressed: () {
            rightCount = 0;
            questionIndex = 0;
            setState(() {
              viewStatus = ViewStatus.Question;
            });
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget view;

    if (viewStatus == ViewStatus.Question) {
      view = _buildQuestionView();
    } else if (viewStatus == ViewStatus.Result) {
      view = _buildResultView();
    } else if (viewStatus == ViewStatus.Final) {
      view = _buildFinalView();
    }

    return CupertinoPageScaffold(child: view);
  }
}
