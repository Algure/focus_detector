import 'package:flutter/material.dart';
import 'package:focus_detector/src/focus_area_widget.dart';


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

  bool _isPointed = false;

  @override
  void initState() {
    final _focusPointerArea = FocusPointerArea.of(context);
    assert(_focusPointerArea!=null);
    print('found: ${_focusPointerArea!.getPointerState()}');
    _isPointed = FocusPointerArea.of(context)!.getPointerState();
    FocusPointerArea.of(context)!.addListener(pointerListener);
  }

  @override
  Widget build(BuildContext context) {
    print('state changed! _isPointed: $_isPointed');
    // if(_isPointed){
    //   widget.onFocused!.call();
    // }
    return MouseRegion(
      onEnter: (_){
        if( _isPointed && widget.onFocused != null){
          widget.onFocused!.call();
        }
      },
      onHover: (_){
        if( _isPointed && widget.onFocused != null){
          widget.onFocused!.call();
        }
      },
      onExit: (_){
        if( widget.onFocusLoss != null){
          widget.onFocusLoss!();
        }
      },
      child: widget.child,
    );
  }


  pointerListener() {
    _isPointed = FocusPointerArea.of(context)!.getPointerState();
    if(_isPointed){
      widget.onFocused!.call();
    }else{
      widget.onFocusLoss!.call();
    }
    if(mounted) {
      setState(() {});
    }
  }
}


