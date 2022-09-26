import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';


class FocusTestItem extends StatefulWidget {
  FocusTestItem({Key? key,
    this.keepColor = false
  }) : super(key: key);

  bool keepColor;

  @override
  State<FocusTestItem> createState() => _FocusTestItemState();
}

class _FocusTestItemState extends State<FocusTestItem> {

  bool isIn = false;
  Color color = Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FocusPointerDetector(
          onFocused: (){
            setState(() {
              color = Colors.pinkAccent;
            });
          },
          onFocusLoss: widget.keepColor?null:(){
            setState(() {
              color = Colors.amber;
            });
          },
          child: Container(
            key: Key('con1'),
            height: 100,
            width: 100,
            color: color,
          )
      ),
    );
  }
}
