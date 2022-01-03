import 'package:flutter/material.dart';
import 'package:swipeable_null_safety/swipeable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const SwipeableDemo(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class SwipeableDemo extends StatefulWidget {
  const SwipeableDemo({Key? key}) : super(key: key);

  @override
  SwipeableDemoState createState() {
    return SwipeableDemoState();
  }
}

class SwipeableDemoState extends State<SwipeableDemo> {
  bool leftSelected = false;
  bool rightSelected = false;

  @override
  Widget build(BuildContext context) {
    String text = "nothing selected";

    if (leftSelected) text = "left selected";

    if (rightSelected) text = "right selected";

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(8.0),
            child: Swipeable(
              threshold: 60.0,
              onSwipeLeft: () {
                setState(() {
                  rightSelected = true;
                  leftSelected = false;
                });
              },
              onSwipeRight: () {
                setState(() {
                  rightSelected = false;
                  leftSelected = true;
                });
              },
              child: Container(
                child: ListTile(title: Text(text)),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                ),
                child: ListTile(
                  leading: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: leftSelected ? Colors.blue[500] : Colors.grey[600],
                    ),
                  ),
                  trailing: Container(
                    width: 12.0,
                    height: 12.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: rightSelected
                          ? Colors.lightGreen[500]
                          : Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
