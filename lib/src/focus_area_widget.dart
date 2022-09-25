
import 'dart:core';
import 'dart:core' as cr;

import 'package:flutter/material.dart';

import 'focus_notifier.dart';


class FocusPointerArea extends StatelessWidget {
  FocusPointerArea({Key? key, required this.child}) : super(key: key);

  final Widget child;
  bool _isPointed = false;


  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (mouseEvent){
          counterValueNotifier.value = true;
          counterValueNotifier.notifyListeners();
        },
        onPointerUp: (mouseEvent){
          print('cancelled');
          counterValueNotifier.value = false;
          counterValueNotifier.notifyListeners();
          // print(_counterValueNotifier.l)
        },
        onPointerCancel: (mouseEvent){
          counterValueNotifier.value = false;
          counterValueNotifier.notifyListeners();
        },
      child: child,
    );
  }

  void addListener(Function() onChanged){
    counterValueNotifier.addListener(onChanged);
  }

  bool getPointerState()=> counterValueNotifier.value;

  static FocusPointerArea? of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<FocusPointerArea>()!;
  }
}


