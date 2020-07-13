import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var _pageController = PageController();

  Widget pageView() {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.orange),
        Container(color: Colors.yellow),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          pageView(),
        ],
      ),
    );
  }
}
