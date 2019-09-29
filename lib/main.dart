import 'dart:math';

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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    wstanka = EditableText(
      focusNode: focusNode,
      controller: myTextController,
      cursorColor: Colors.amberAccent,
      backgroundCursorColor: Colors.yellowAccent,
      style: TextStyle(
        color: Colors.black,
        backgroundColor: Colors.grey,
      ),
      onEditingComplete: _deleteWstanka(),
      onChanged: (text) {
        print('1.parameter text:$text');
        print('2.parameter contriller.text:' + myTextController.text);
        myTextController.text = text;
        print('3.parameter contriller.text AFTER:' + myTextController.text);
        backTextController = myTextController.text;
        print('3.backTextController:' + backTextController);
      },
    );

    //    myTextController.addListener(() {
    //      print("what you see");
    //    });
  }

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  _deleteWstanka() {
    setState(() {
      wstanka = Container();
      print('9.pwstanka become a container:');
    });
  }

  _vankaWstanka() {
    setState(() {
      wstanka = EditableText(
        focusNode: focusNode,
        controller: myTextController,
        cursorColor: Colors.amberAccent,
        backgroundCursorColor: Colors.yellowAccent,
        style: TextStyle(
          color: Colors.black,
          backgroundColor: Colors.grey,
        ),
        onEditingComplete: _deleteWstanka(),
        onChanged: (text) {
          print('1.parameter text:$text');
          print('2.parameter contriller.text:' + myTextController.text);
          myTextController.text = text;
          print('3.parameter contriller.text AFTER:' + myTextController.text);
          backTextController = myTextController.text;
          print('3.backTextController:' + backTextController);
        },
      );
      print('9.pwstanka become a container:');
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _vankaWstanka();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
