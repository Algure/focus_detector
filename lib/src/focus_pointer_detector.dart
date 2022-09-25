import 'package:flutter/material.dart';
import 'package:focus_detector/src/focus_area_widget.dart';
import 'package:focus_detector/src/focus_notifier.dart';


class FocusPointerDetector extends StatelessWidget {
  const FocusPointerDetector({Key? key,
    required this.child,
    this.onFocused,
    this.onFocusLoss
  }) : super(key: key);

  final Function()? onFocused;
  final Function()? onFocusLoss;
  final Widget child;


  @override
  Widget build(BuildContext context) {

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   if(FocusNotifierWidget.of(context)!.isPointed){
    //     onFocused!.call();
    //   }else{
    //     onFocusLoss!.call();
    //   }
    // });
    return MouseRegion(
      onEnter: (_){
        print('entered: ${FocusNotifierWidget.of(context)!.isPointed}');
        if( FocusNotifierWidget.of(context)!.isPointed && onFocused != null){
          onFocused!.call();
        }
      },
      onHover: (_){
        // print('hoverinng: ${FocusNotifierWidget.of(context)!.isPointed}');
        // if( FocusNotifierWidget.of(context)!.isPointed && onFocused != null){
        //   onFocused!.call();
        // }
      },
      onExit: (_){
        // print('exiting: ${FocusNotifierWidget.of(context)!.isPointed}');
        if(onFocusLoss != null) {
          onFocusLoss!.call();
        }
      },
      child: child,
    );
  }
}

//
// class FocusPointerDetector extends StatefulWidget {
//   const FocusPointerDetector({Key? key,
//     required this.child,
//     this.onFocused,
//     this.onFocusLoss
//   }) : super(key: key);
//
//  final Function()? onFocused;
//  final Function()? onFocusLoss;
//  final Widget child;
//
//   @override
//   State<FocusPointerDetector> createState() => _FocusPointerDetectorState();
// }
//
// class _FocusPointerDetectorState extends State<FocusPointerDetector> {
//
//   bool _isPointed = false;
//
//   bool _isPointerCalled = false;
//
//   @override
//   void initState() {
//     // print('found: ${_focusPointerArea!.getPointerState()}');
//     // _isPointed = FocusPointerDetector(child: child).of(context)!.getPointerState();
//     // FocusPointerArea.of(context)!.addListener(pointerListener);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final _focusPointerArea = FocusNotifierWidget.of(context);
//     assert(_focusPointerArea!=null);
//     print('state changed! _isPointerCalled: $_isPointerCalled');
//     // if(_isPointerCalled){
//     //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//     //     if( FocusNotifierWidget.of(context)!.isPointed && widget.onFocused != null){
//     //       widget.onFocused!.call();
//     //       _isPointerCalled = true;
//     //     }else if( widget.onFocusLoss != null){
//     //       widget.onFocusLoss!.call();
//     //       _isPointerCalled = false;
//     //     }
//     //   });
//     // }
//     return MouseRegion(
//         onEnter: (_){
//           widget.onFocused!.call();
//         },
//         onExit: (_){
//           // if(!pointerNotifier.value) return;
//           widget.onFocused!.call();
//         },
//         child: widget.child
//     );
//
//     return MouseRegion(
//       onEnter: (_){
//         print('enter');
//         if( FocusNotifierWidget.of(context)!.isPointed ){
//           widget.onFocused!.call();
//           _isPointerCalled = true;
//         }
//       },
//       onHover: (_){
//         print('hovering');
//         if( widget.onFocused != null){
//           widget.onFocused!.call();
//           _isPointerCalled = true;
//         }
//       },
//       onExit: (_){
//         print('exit');
//         if( widget.onFocusLoss != null){
//           widget.onFocusLoss!();
//           _isPointerCalled = false;
//         }
//       },
//       child: widget.child,
//     );
//   }
// }


