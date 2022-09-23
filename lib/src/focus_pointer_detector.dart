import 'package:flutter/material.dart';
import 'package:focus_detector/src/focus_area_widget.dart';

class FocusPointerDetector extends StatelessWidget {
  FocusPointerDetector({Key? key,
    required this.child,
    this.onFocused,
    this.onFocusLoss
  }) : super(key: key);

  Function? onFocused;
  Function? onFocusLoss;
  Widget child;

  late FocusPointerArea? _focusPointerArea;

  @override
  Widget build(BuildContext context) {
    _focusPointerArea = context.findAncestorWidgetOfExactType<FocusPointerArea>();
    assert(_focusPointerArea!=null);
    return MouseRegion(
      onEnter: (_){
        if(_focusPointerArea!.pointerNotifier.value && onFocused != null){
          onFocused!();
        }
      },
      onExit: (_){
        if(_focusPointerArea!.pointerNotifier.value && onFocusLoss != null){
          onFocusLoss!();
        }
      },
      child: child,
    );
  }
}
