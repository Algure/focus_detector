import 'package:flutter/material.dart';

class FocusNotifierWidget extends InheritedWidget{

  final bool isPointed;

  FocusNotifierWidget({
    required this.isPointed,
    required super.child
  });

  static FocusNotifierWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<FocusNotifierWidget>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

}