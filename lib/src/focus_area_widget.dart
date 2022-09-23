
import 'package:flutter/material.dart';

class FocusPointerArea extends StatelessWidget {

  FocusPointerArea({
    Key? key,
    required this.child}) : super(key: key);

  final ValueNotifier<bool> pointerNotifier = ValueNotifier<bool>(false);
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_){
        pointerNotifier.value = true;
      },
      onPointerUp: (_){
        pointerNotifier.value = false;
      },
      child: child,
    );
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


