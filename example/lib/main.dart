import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  FocusNode focusNode = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  FocusScopeNode focusNodeScope = FocusScopeNode();

  Color color1 = Colors.amber;
  Color color2 = Colors.amber;
  Color color3 = Colors.amber;
  Color color4 = Colors.amber;

  bool isPointed = false;



  @override
  void initState() {
    focusNodeScope.addListener(() {
      print('focused');
    });
    focusNode.addListener(() {
      print('focused');
    });
    focusNode2.addListener(() {
      print('focused 2');
    });
    focusNode3.addListener(() {
      print('focused 3');
    });
    focusNode4.addListener(() {
      print('focused 4');
    });
    focusNode.requestFocus(focusNode2);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FocusPointerDetector(
              onFocused: (){
                setState(() {
                  color1 = Colors.pinkAccent;
                });
              },
              onFocusLoss: (){
                setState(() {
                  color1 = Colors.amber;
                });
              },
                child: Container(
                  height: 100,
                  width: 100,
                  color: color1,
                )
            ),
            FocusPointerDetector(
              onFocused: (){
                setState(() {
                  color2 = Colors.pinkAccent;
                });
              },
              onFocusLoss: (){
                setState(() {
                  color2 = Colors.amber;
                });
              },
                child: Container(
                  height: 100,
                  width: 100,
                  color: color2,
                )
            ),
            FocusPointerDetector(
              onFocused: (){
                setState(() {
                  color3 = Colors.pinkAccent;
                });
              },
              onFocusLoss: (){
                setState(() {
                  color3 = Colors.amber;
                });
              },
                child: Container(
                  height: 100,
                  width: 100,
                  color: color3,
                )
            ),
            FocusPointerDetector(
              onFocused: (){
                setState(() {
                  color4 = Colors.pinkAccent;
                });
              },
              onFocusLoss: (){
                setState(() {
                  color4 = Colors.amber;
                });
              },
                child: Container(
                  height: 100,
                  width: 100,
                  color: color4,
                )
            ),
          ],
        ),
      ),
    );
  }
}
