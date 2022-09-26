import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:focus_detector/focus_detector.dart';

import 'test_widget.dart';

void main() {
  testWidgets('Test FocusArea and FocusDetector', (tester) async {
    await tester.pumpWidget(const TestApp());
    await tester.dragFrom(const Offset(50.0, 50.0), const Offset(0.0, -400.0));

    // Color(0xffff4081);
    // Color(0xffffc107);
    await tester.pumpAndSettle(Duration(seconds: 5));
    // Create the Finders.
    final con1 = tester.widget<Container>(find.byKey(Key('con1')));
    final con2 = tester.widget<Container>(find.byKey(Key('con2')));
    final con3 = tester.widget<Container>(find.byKey(Key('con3')));
    final con4 = tester.widget<Container>(find.byKey(Key('con4')));
    expect(con1.color!.value, Colors.pinkAccent.value);
    expect(con2.color!.value, Colors.pinkAccent.value);
    expect(con3.color!.value, Colors.pinkAccent.value);
    expect(con4.color!.value, Colors.pinkAccent.value);
  });

}

