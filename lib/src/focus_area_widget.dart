
import 'dart:core';
import 'dart:core' as cr;

import 'package:flutter/material.dart';
//
// class FocusPointerAreaNotifier extends InheritedWidget {
//
//   bool isPointerDown;
//
//   FocusPointerAreaNotifier({
//     super.key,
//     this.isPointerDown = true,
//     required super.child});
//
//   static of(BuildContext context) {
//     return context
//         .dependOnInheritedWidgetOfExactType<FocusPointerAreaNotifier>()!;
//   }
//
//   @override
//   bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
//
// }

class FocusPointerArea extends StatelessWidget {
  FocusPointerArea({Key? key, required this.child}) : super(key: key);

  final Widget child;
  final ValueNotifier<bool> _counterValueNotifier = ValueNotifier<bool>(true);

  bool ischanged = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (mouseEvent){
          _counterValueNotifier.value = true;
          _counterValueNotifier.notifyListeners();
        },
        onPointerUp: (mouseEvent){
          _counterValueNotifier.value = false;
          _counterValueNotifier.notifyListeners();
        },
      child: child,
    );
  }

  void addListener(Function() onChanged){
    _counterValueNotifier.addListener(onChanged);
  }

  bool getPointerState()=> _counterValueNotifier.value;

  static of(BuildContext context) {
    return context
        .findAncestorWidgetOfExactType<FocusPointerArea>()!;
  }
}



// class FocusDetector extends StatefulWidget {
//   FocusDetector({
//     Key? key,
//     this.onFocusDetected
//   }) : super(key: key);
//
//   Function? onFocusDetected;
//   @override
//   State<FocusDetector> createState() => _FocusDetectorState();
// }
//
// class _FocusDetectorState extends State<FocusDetector> {
//   bool isPointed = false;
//
//   Color color1 = Colors.amberAccent;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Listener(
//         onPointerDown: (mouseEvent){
//           setState(() {
//             isPointed = true;
//           });
//         },
//         onPointerUp: (mouseEvent){
//           setState(() {
//             isPointed = false;
//           });
//         },
//         child: MouseRegion(
//           onEnter: (_){
//             if(!isPointed) return;
//             setState(() {
//               color1 = Colors.deepPurpleAccent;
//             });
//           },
//           onExit: (_){
//             if(!isPointed) return;
//             setState(() {
//               color1 = Colors.amber;
//             });
//           },
//           child: Container(
//             height: 100,
//             width: 200,
//             color: color1,
//           ),
//         )
//     );
//   }
// }


