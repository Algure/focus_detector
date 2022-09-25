import 'package:flutter/material.dart';
import 'package:focus_detector/src/focus_notifier.dart';

/// The [FocusPointerDetector] turns the region/widget wrapped by this widget into a listener for focus_detector callbacks and is meant to wrap widgets
/// whose regions are to be monitored for touch events.
///
/// Note: Use of listener, MouseRegion or GestureDetector as child widgets is prone to erratic behaviour.
class FocusPointerDetector extends StatefulWidget {
  const FocusPointerDetector({Key? key,
    required this.child,
    this.onFocused,
    this.onFocusLoss
  }) : super(key: key);

  /// This is called exactly once when the pointer enters the region of this widget while the pointer is clicked
  /// or when the pointer is clicked while in the region of this widget.
 final Function()? onFocused;
  /// This is called exactly once when the pointer leaves the region of this widget while the pointer is clicked
  /// or when the pointer goes up while in the region of this widget.
 final Function()? onFocusLoss;
 /// This is the child widget which defines the size/area of the area to be detected.
 final Widget child;

  @override
  State<FocusPointerDetector> createState() => _FocusPointerDetectorState();
}

class _FocusPointerDetectorState extends State<FocusPointerDetector> {

  /// Required to keep track of pointer state in case the pointer down event is called
  /// when hovering above widget in order to call the [widget.onFocused] function.
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
          widget.onFocusLoss!.call();
          _isPointerCalled = false;
        }
        _isPointerCalled = false;
      },
      child: widget.child,
    );
  }
}


