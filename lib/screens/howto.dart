import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class HowtoPage extends StatefulWidget {
  HowtoPage({Key key}) : super(key: key);

  @override
  _HowtoPageState createState() => _HowtoPageState();
}

class _HowtoPageState extends State<HowtoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: SafeArea(
        child: FutureBuilder(
          future: rootBundle.loadString("assets/markdown/howto.md"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Markdown(
                controller: ScrollController(),
                data: snapshot.data,
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
