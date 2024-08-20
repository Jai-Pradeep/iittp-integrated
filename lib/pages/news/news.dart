import 'package:flutter/material.dart';
import 'package:iittp_integrated/pages/news/scrollable_widgets.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snap Scrolling Widgets Example'),
        ),
        body: Center(
          child: SizedBox(
            height: 180,
            child: ScrollableWidgets(),
          ),
        ),
      ),
    );
  }
}
