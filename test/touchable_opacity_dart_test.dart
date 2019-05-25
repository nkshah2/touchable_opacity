import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:touchable_opacity/touchable_opacity_dart.dart';

void main() {
  testWidgets("Touchable Opacity renders correctly",
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
        ),
      ),
    ));

    expect(find.byKey(Key("nksystems.touchable_opacity_gesture_detector")),
        findsOneWidget);
    expect(find.text("Child Text"), findsOneWidget);
  });

  testWidgets("Touchable Opacity onTapDown works correctly",
      (WidgetTester tester) async {
    int count = 0;
    Function onTapDown = (_) {
      count++;
    };

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
          onTapDown: onTapDown,
        ),
      ),
    ));

    await tester.tap(find.text("Child Text"));
    await tester.pump();

    expect(count, equals(1));
  });

  testWidgets("Touchable Opacity onTapUp works correctly",
      (WidgetTester tester) async {
    int count = 0;
    Function onTapUp = (_) {
      count++;
    };

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
          onTapUp: onTapUp,
        ),
      ),
    ));

    await tester.tap(find.text("Child Text"));
    await tester.pump();

    expect(count, equals(1));
  });

  testWidgets("Touchable Opacity onTap works correctly",
      (WidgetTester tester) async {
    int count = 0;
    Function onTap = () {
      count++;
    };

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
          onTap: onTap,
        ),
      ),
    ));

    await tester.tap(find.text("Child Text"));
    await tester.pump();

    expect(count, equals(1));
  });

  testWidgets("Touchable Opacity onTapCancel works correctly",
      (WidgetTester tester) async {
    int count = 0;
    Function onTapCancel = () {
      count++;
    };

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
          onTapCancel: onTapCancel,
        ),
      ),
    ));

    await tester.drag(find.text("Child Text"), Offset(300, 300));
    await tester.pump();

    expect(count, equals(1));
  });

  testWidgets("Touchable Opacity onDoubleTap works correctly",
      (WidgetTester tester) async {
    int count = 0;
    Function onDoubleTap = () {
      count++;
    };

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
          onDoubleTap: onDoubleTap,
        ),
      ),
    ));

    await tester.tap(find.text("Child Text"));
    await tester.pump(Duration(milliseconds: 50));
    await tester.tap(find.text("Child Text"));
    await tester.pump(Duration(milliseconds: 500));

    expect(count, equals(1));
  });
  
  testWidgets("Touchable Opacity onLongPress works correctly", (WidgetTester tester) async {
    int count = 0;
    Function onLongPress = () {
      count++;
    };

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: TouchableOpacity(
          child: Text("Child Text"),
          onLongPress: onLongPress,
        ),
      ),
    ));
    
    await tester.startGesture(tester.getCenter(find.text("Child Text")));
    await tester.pump(Duration(milliseconds: 500));

    expect(count, equals(1));
  });
}
