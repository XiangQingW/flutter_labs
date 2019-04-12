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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: <Widget>[
        _buildSliverAppBar(),
        _buildAdapter(),
        _buildGrid(context),
        _buildList(context),
        _buildSliverFillViewport(),
      ]),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text("title"),
        background: Image.network(
            "https://www.snapphotography.co.nz/wp-content/uploads/New-Zealand-Landscape-Photography-prints-12.jpg",
            fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildAdapter() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 100.0,
        child: Text("adapter"),
      )
    );
  }

  Widget _buildGrid(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 4.0,
        ),
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: Text("haha"),
        );
      },
        childCount: 10
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return SliverFixedExtentList(delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.green,
        child: Text("bb"),
      );
    }, childCount: 10), itemExtent: 50);
  }

  Widget _buildSliverFillViewport(){
    return SliverFillViewport(
      delegate: SliverChildListDelegate([
        Container(
          height: 10.0,
          color: Colors.grey,
          child: Center(
              child: Text(
                'SliverFillViewport',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              )),
        ),
      ]),
      viewportFraction: 10.0,
    );
  }

}
