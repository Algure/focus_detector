import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';


class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Detector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TestWidget(),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key, this.height=500, this.width=300}) : super(key: key);

  final double height;
  final double width;

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  Color color1 = Colors.amber;
  Color color2 = Colors.amber;
  Color color3 = Colors.amber;
  Color color4 = Colors.amber;


  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getPackageWidgetTree()
    );
  }

  Widget _getPackageWidgetTree(){
    return Container(
      height: widget.height,
      width: widget.width,
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
                // onFocusLoss: (){
                //   // if(!pointerNotifier.value) return;
                //   setState(() {
                //     color1 = Colors.amber;
                //   });
                // },
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
                // onFocusLoss: (){
                //   setState(() {
                //     color2 = Colors.amber;
                //   });
                // },
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
                // onFocusLoss: (){
                //   setState(() {
                //     color3 = Colors.amber;
                //   });
                // },
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
                // onFocusLoss: (){
                //   setState(() {
                //     color4 = Colors.amber;
                //   });
                // },
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
}
