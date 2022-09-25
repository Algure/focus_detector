import 'package:flutter/material.dart';
import 'package:focus_detector/src/focus_notifier.dart';


class FocusPointerDetector extends StatefulWidget {
  const FocusPointerDetector({Key? key,
    required this.child,
    this.onFocused,
    this.onFocusLoss
  }) : super(key: key);

 final Function()? onFocused;
 final Function()? onFocusLoss;
 final Widget child;

  @override
  State<FocusPointerDetector> createState() => _FocusPointerDetectorState();
}

class _FocusPointerDetectorState extends State<FocusPointerDetector> {

  bool _isPointerCalled = false;

  @override
  Widget build(BuildContext context) {
    final _focusPointerArea = FocusNotifierWidget.of(context);
    assert(_focusPointerArea!=null);
    if(_isPointerCalled){
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if( FocusNotifierWidget.of(context)!.isPointed && widget.onFocused != null){
          widget.onFocused!.call();
          _isPointerCalled = true;
        }else if( widget.onFocusLoss != null){
          widget.onFocusLoss!.call();
          _isPointerCalled = false;
        }
      });
    }
    return MouseRegion(
      onEnter: (_){
        _isPointerCalled = true;
        if( FocusNotifierWidget.of(context)!.isPointed ){
          widget.onFocused!.call();
        }
      },
      onHover: (_){
        if(_isPointerCalled) return;
        _isPointerCalled = true;
        if(FocusNotifierWidget.of(context)!.isPointed && widget.onFocused != null){
          widget.onFocused!.call();
        }
      },
      onExit: (_){
        if( widget.onFocusLoss != null){
          widget.onFocusLoss!();
          _isPointerCalled = false;
        }
        _isPointerCalled = false;
      },
      child: widget.child,
    );
  }
}


