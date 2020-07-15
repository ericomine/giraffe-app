import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePage extends StatefulWidget {
  final questions = ["Observação", "Sentimento", "Necessidade", "Pedido"];

  final hints = [
    "Descreva aqui uma situação que tenha afetado seu bem-estar de forma específica e objetiva, evitando julgamentos de valor.",
    "O que você sentiu nesta situação?",
    "Identifique suas necessidades não-atendidas por trás deste sentimento.",
    "Faça um pedido para atender estas necessidades."
  ];

  final images = [
    "assets/graphics/observation.jpg",
    "assets/graphics/feelings.jpg",
    "assets/graphics/needs.jpg",
    "assets/graphics/request.jpg",
  ];

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var _pageController = PageController();

  Widget entryPage(int index) {
    // This will hide status bar in Android.
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: SizedBox(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      widget.images[index],
                      fit: BoxFit.fitWidth,
                      color: Colors.orange,
                      colorBlendMode: BlendMode.color,
                    ),
                  ),
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.withOpacity(0.3),
                              Colors.white.withOpacity(1.0),
                            ],
                            stops: [0, 0.8],
                            transform: GradientRotation(pi / 2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.questions[index],
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            fontStyle:
                                Theme.of(context).textTheme.headline5.fontStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 220,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                margin: const EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: widget.hints[index],
                    hintMaxLines: 5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return PageView(
            controller: _pageController,
            children: <Widget>[
              entryPage(0),
              entryPage(1),
              entryPage(2),
              entryPage(3),
            ],
          );
        },
      ),
    );
  }
}
