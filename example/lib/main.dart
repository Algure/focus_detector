import 'package:eazigrid/eazigrid.dart';
import 'package:example/focus_test_item.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

void main() {
  EaziGridFlowHandler.handleEaziError();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Detector Demo',
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
      body: _getGridPackageWidgetTree()
    );
  }




  Widget _getGridPackageWidgetTree(){
    return Container(
      child: FocusPointerArea(
        child: EaziGrid(
            isScrollable: true,
            horizontalAlignment: EaziAlignment.start,
            children: [
              for(int i=0; i<=50; i++)
                FocusTestItem(
                  keepColor: true,
                )
            ]),
      ),
    );
  }

  Widget _getTestPackageWidgetTree(){
    return Container(
      child: FocusPointerArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FocusPointerDetector(
                onFocused: (){
                  setState(() {
                    color1 = Colors.pinkAccent;
                  });
                },
                child: Container(
                  key: Key('con1'),
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
                child: Container(
                  key: Key('con2'),
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
                child: Container(
                  key: Key('con3'),
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
                child: Container(
                  key: Key('con4'),
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

  Widget _getPackageWidgetTree(){
    return FocusPointerArea(
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
      ),
    );
  }

}


