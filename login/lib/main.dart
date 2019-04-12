import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Login());
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _nameFocus = FocusNode();
  final _pwFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              height: 200,
              width: 200,
              child: Center(
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 32),
                ),
              )),
          TextField(
            decoration: InputDecoration(labelText: "name"),
            textInputAction: TextInputAction.next,
            focusNode: _nameFocus,
            onSubmitted: (input){
              _nameFocus.unfocus();
              FocusScope.of(context).requestFocus(_pwFocus);
            },
          ),
          TextField(
            focusNode: _pwFocus,
            decoration: InputDecoration(labelText: "pwd"),
            textInputAction: TextInputAction.done,
            obscureText: true,
          ),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('login'),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
