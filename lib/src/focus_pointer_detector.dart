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

  @override
  Widget build(BuildContext context) {
    _focusPointerArea = FocusPointerArea.of(context);
    assert(_focusPointerArea!=null);
    print('found: ${_focusPointerArea!.pointerNotifier.value}');

    return MouseRegion(
      onEnter: (_){
        if( context.findAncestorWidgetOfExactType<FocusPointerAreaNotifier>()!.pointerNotifier.value && onFocused != null){
          onFocused!();
        }
      },
      onExit: (_){
        if( context.findAncestorWidgetOfExactType<FocusPointerAreaNotifier>()!.pointerNotifier.value && onFocusLoss != null){
          onFocusLoss!();
        }
      },
      child: child,
    );
  }
}
