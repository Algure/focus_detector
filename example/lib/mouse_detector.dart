import 'package:flutter/material.dart';

// class MouseDetector extends StatelessWidget {
//   MouseDetector({Key? key,
//     required this.color,
//     required this.onEnter,
//     required this.onExit
//   }) : super(key: key);
//
//   Function() onEnter;
//   Function() onExit;
//   Color color;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//         onEnter: (_)=> onEnter.call(),
//         onExit: (_)=> onExit.call(),
//         child: Container(
//           height: 100,
//           width: 100,
//           color: color,
//         )
//     );
//   }
// }


class MouseDetector extends StatefulWidget {
  MouseDetector({Key? key,
    required this.color,
    required this.onEnter,
    required this.onExit
  }) : super(key: key);

  Function() onEnter;
  Function() onExit;
  Color color;

  @override
  State<MouseDetector> createState() => _MouseDetectorState();
}

class _MouseDetectorState extends State<MouseDetector> {
  bool isIn = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_){
          isIn=true;
          widget.onEnter.call();
        },
        onHover: (_) {
          if(isIn) return;
          print('hovering !');
          isIn=true;
          widget.onEnter.call();
        },
        onExit: (_) {
          isIn = false;
          widget.onExit.call();
        },
        child: Container(
          height: 100,
          width: 100,
          color: widget.color,
        )
    );
  }
}
