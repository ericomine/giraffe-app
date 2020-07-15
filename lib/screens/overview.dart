import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/graphics/giraffe.svg',
              height: 160,
              width: 160,
            ),
            SizedBox(
              height: 40,
            ),
            Text("Você ainda não tem nenhuma entrada no diário."),
          ],
        ),
      ),
    );
  }
}
