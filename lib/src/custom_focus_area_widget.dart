
import 'package:flutter/material.dart';


class FocusDetector extends StatefulWidget {
  FocusDetector({
    Key? key,
    this.onFocusDetected
  }) : super(key: key);

  Function? onFocusDetected;
  @override
  State<FocusDetector> createState() => _FocusDetectorState();
}

class _FocusDetectorState extends State<FocusDetector> {
  bool isPointed = false;

  Color color1 = Colors.amberAccent;

  @override
  Widget build(BuildContext context) {

    return Listener(
        onPointerDown: (mouseEvent){
          setState(() {
            isPointed = true;
          });
        },
        onPointerUp: (mouseEvent){
          setState(() {
            isPointed = false;
          });
        },
        child: MouseRegion(
          onEnter: (_){
            if(!isPointed) return;
            setState(() {
              color1 = Colors.deepPurpleAccent;
            });
          },
          onExit: (_){
            if(!isPointed) return;
            setState(() {
              color1 = Colors.amber;
            });
          },
          child: Container(
            height: 100,
            width: 200,
            color: color1,
          ),
        )
    );
  }
}


