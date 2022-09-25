
import 'dart:core';
import 'dart:core' as cr;

import 'package:flutter/material.dart';

import 'focus_notifier.dart';

class FocusPointerArea extends StatefulWidget {
  const FocusPointerArea({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<FocusPointerArea> createState() => _FocusPointerAreaState();
}

class _FocusPointerAreaState extends State<FocusPointerArea> {
  bool _isPointed = false;


  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (mouseEvent){
        print('pointer down');
        setPointer(true);
      },
      onPointerUp: (mouseEvent){
        print('cancelled');
        setPointer(false);
        // print(_counterValueNotifier.l)
      },
      child: FocusNotifierWidget(
          isPointed: _isPointed,
        child: widget.child
      ),
    );
  }

  void setPointer(bool bool) {
    _isPointed = bool;
    if(mounted) {
      setState(() {});
    }
  }
}




