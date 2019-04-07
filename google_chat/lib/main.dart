import 'package:flutter/material.dart';

void main() {
  runApp(Chat());
}

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "chat a", home: ChatHome());
  }
}

class ChatHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputState();
  }
}

class InputState extends State<ChatHome> with TickerProviderStateMixin {
  final _textControler = TextEditingController();
  final _messages = <ChatMessage>[];
  var _canSend = false;

  void _handleSubmit(String text) {
    print("hello");
    _textControler.clear();
    setState(() {
      _canSend = false;
    });

    if (text.isEmpty) {
      return;
    }

    final message = ChatMessage(
      text: text,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 700)),
    );
    setState(() {
      _messages.insert(0, message);
    });

    message.animationController.forward();
  }

  Widget _buildTextEditor() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 19.0),
            child: Row(
              children: <Widget>[
                Flexible(
                    child: TextField(
                  controller: _textControler,
                  onSubmitted: _handleSubmit,
                  onChanged: (String text) {
                    setState(() {
                      _canSend = text.length > 0;
                    });
                  },
                  decoration:
                      InputDecoration.collapsed(hintText: "Send a message"),
                )),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: _canSend ? () => _handleSubmit(_textControler.text) : null))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chat bar"),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 10.0,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                padding: EdgeInsets.all(6.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, int indx) => _messages[indx]),
          ),
          Divider(
            height: 5.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextEditor(),
          )
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  static const _name = "wangxiangqing";

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        axisAlignment: 0.0,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(child: Text(_name[0]))),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _name,
                        style: Theme.of(context).textTheme.subhead,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 5.0), child: Text(text))
                    ],
                  ),
                )
              ],
            )));
  }
}
