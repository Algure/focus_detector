import 'package:flutter/material.dart';

/// An [InheritedNotifier] which broadcasts the [isPointed] value to [FocusPointerDetector] widgets further down the widget tree contained in
/// the [child] parameter.
/// The [FocusNotifierWidget] widget is an internal widget of this package and rebuilds the widget tree whenever [updateShouldNotify]
/// is called to ensure proper behaviour of the package.
///
class FocusNotifierWidget extends InheritedNotifier{

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