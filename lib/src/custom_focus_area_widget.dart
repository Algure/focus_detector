
import 'package:flutter/material.dart';

class FocusAreaWidget extends StatelessWidget {
  FocusAreaWidget({
    key,
    this.onFocusDetected
  }) : super(key: key);
  
  Function? onFocusDetected;

  @override
  Widget build(BuildContext context) {
    return FocusTrapArea(
        focusNode: FocusNode(),
        child: Container(
          
        )
    );
  }
}

