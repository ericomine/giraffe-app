import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var _pageController = PageController();

  Widget entryPage(int index) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.yellow],
            stops: [0, 1],
            transform: GradientRotation(pi / 3),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "Page $index",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            TextField(
              enabled: true,
              showCursor: true,
              decoration: InputDecoration(fillColor: Colors.white),
              minLines: 5,
              maxLines: null,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return PageView(
          controller: _pageController,
          children: <Widget>[
            entryPage(0),
            entryPage(1),
            entryPage(2),
          ],
        );
      },
    );
  }
}
