import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipeable_null_safety/swipeable.dart';

void main() {
  testWidgets('swipeable', (tester) async {
    await tester.pumpWidget(const TestApp());
    expect(find.text('none'), findsOneWidget);
    await tester.drag(find.byType(Swipeable), const Offset(500.0, 0));
    await tester.pumpAndSettle();
    expect(find.text('none'), findsNothing);
    expect(find.text('left'), findsNothing);
    expect(find.text('right'), findsOneWidget);
    await tester.drag(find.byType(Swipeable), const Offset(-500.0, 0));
    await tester.pumpAndSettle();
    expect(find.text('none'), findsNothing);
    expect(find.text('right'), findsNothing);
    expect(find.text('left'), findsOneWidget);
  });
}

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  _TestAppState createState() {
    return _TestAppState();
  }
}

class _TestAppState extends State<TestApp> {
  String _state = 'none';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Swipeable(
              background: Container(color: Colors.blue),
              child: Container(
                color: Colors.white,
                key: const Key('foo'),
                child: Center(child: Text(_state)),
                constraints: const BoxConstraints.expand(),
              ),
              onSwipeLeft: () => setState(() {
                _state = "left";
              }),
              onSwipeRight: () => setState(() {
                _state = "right";
              }),
            ),
          ),
        ),
      ),
    );
  }
}
