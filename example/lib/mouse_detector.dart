import 'package:flutter/material.dart';

class MouseDetector extends StatelessWidget {
  MouseDetector({Key? key,
    required this.color,
    required this.onEnter,
    required this.onExit
  }) : super(key: key);

  Function() onEnter;
  Function() onExit;
  Color color;


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (_)=> onEnter.call(),
        onExit: (_)=> onExit.call(),
        child: Container(
          height: 100,
          width: 100,
          color: color,
        )
    );
  }
}
