import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController myTextController = TextEditingController();
  var rnd = new Random();
  String textBufferWstanka;
  String backTextController;
  FocusNode focusNode = new FocusNode();
  Widget wstanka;

  @override
  void initState() {
    wstanka = TextField(
      focusNode: focusNode,
      controller: myTextController,
      onChanged: (text) {
        backTextController =  myTextController.text;
      },
    );
    super.initState();
  }

  @override
  void dispose() {
//    myTextController.dispose();
    super.dispose();
  }

  _deleteWstanka() {
    setState(() {
      wstanka = Container();
//      myTextController.dispose();
      print('9.pwstanka become a container:');
    });
  }

  _vankaWstanka() {
    myTextController = TextEditingController();
    print(backTextController);
//    myTextController.text = backTextController;

    setState(() {
      wstanka = TextField(
        focusNode: focusNode,
        controller: myTextController,
        onChanged: (text) {
//          backTextController = myTextController.text;
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            wstanka,
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("_vankaWstanka"),
              onPressed: _vankaWstanka,
            ),
            FlatButton(
                child: Text("_random"),
                onPressed: () {
                  myTextController.text = rnd.nextInt(1000000000).toString();
                }),
            FlatButton(
              child: Text("_deleteWstanka"),
              onPressed: _deleteWstanka,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myTextController.text = rnd.nextInt(1000000000).toString();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
