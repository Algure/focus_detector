import 'package:example/mouse_detector.dart';
import 'package:flutter/gestures.dart';
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

  Color color1 = Colors.amber;
  Color color2 = Colors.amber;
  Color color3 = Colors.amber;
  Color color4 = Colors.amber;

  bool isPointed = false;

  ValueNotifier<bool> pointerNotifier = ValueNotifier<bool>(false);


  @override
  void initState() {
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getWidgetNoPackage()
    );
  }

  Widget _getPackageWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FocusPointerDetector(
            onFocused: (){
              setState(() {
                color1 = Colors.pinkAccent;
              });
            },
            onFocusLoss: (){
              // if(!pointerNotifier.value) return;
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
              // if(!pointerNotifier.value) return;
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
    );

  }

  Widget _getWidgetNoPackage(){
    return  Listener(
      onPointerDown: (_){
        print('point down');
       isPointed = true;
        if(mounted) {
          setState(() {});
        }
      },
      onPointerUp: (_){
        print('point up');
        isPointed = false;
        if(mounted) {
          setState(() {});
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MouseDetector(
              onEnter: (){
                print('mouse down');
                if(!isPointed) return;
                setState(() {
                  color1 = Colors.pinkAccent;
                });
              },
              onExit: (){
                // if(!pointerNotifier.value) return;
                setState(() {
                  color1 = Colors.amber;
                });
              },
                color: color1,
          ),
          MouseDetector(
              onEnter: (){
                if(!isPointed) return;
                setState(() {
                  color2 = Colors.pinkAccent;
                });
              },
              onExit: (){
                // if(!pointerNotifier.value) return;
                setState(() {
                  color2 = Colors.amber;
                });
              },

                color: color2,
          ),
          MouseDetector(
              onEnter: (){
                if(!isPointed) return;
                setState(() {
                  color3 = Colors.pinkAccent;
                });
              },
              onExit: (){
                // if(!pointerNotifier.value) return;
                setState(() {
                  color3 = Colors.amber;
                });
              },
                color: color3,
          ),
          MouseDetector(
              onEnter: (){
                if(!isPointed) return;
                setState(() {
                  color4 = Colors.pinkAccent;
                });
              },
              onExit: (){
                // if(!pointerNotifier.value) return;
                setState(() {
                  color4 = Colors.amber;
                });
              },
                color: color4,
          ),
        ],
      ),
    );

  }
}


