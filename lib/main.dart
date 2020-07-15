import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:giraffe/common/theme.dart';
import 'screens/history.dart';
import 'screens/overview.dart';
import 'screens/info.dart';
import 'screens/create.dart';
import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Giraffe',
      theme: giraffeTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => MainPage(title: 'Giraffe'),
        '/create': (_) => CreatePage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;

  Widget appBar() {
    return AppBar(
      title: Text(widget.title),
      actions: _selectedPage != 1
          ? null
          : <Widget>[
              Icon(Icons.search),
              Padding(padding: EdgeInsets.only(right: 20)),
            ],
    );
  }

  Widget navBar() {
    const double _iconSize = 24;
    return BottomNavigationBar(
      currentIndex: _selectedPage,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.terrain,
            semanticLabel: "Visão Geral",
            size: _iconSize,
          ),
          title: Text("Visão Geral"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            semanticLabel: "Seu diário",
            size: _iconSize,
          ),
          title: Text("Seu diário"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.help_outline,
            semanticLabel: "Como usar?",
            size: _iconSize,
          ),
          title: Text("Como usar?"),
        ),
      ],
      onTap: selectPage,
    );
  }

  void selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  Widget body() {
    switch (_selectedPage) {
      case 2:
        return InfoPage();
      case 1:
        return HistoryPage();
      case 0:
      default:
        return OverviewPage();
    }
  }

  Widget actionButton() {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed(createRoute),
      tooltip: 'Create',
      child: Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: navBar(),
      body: body(),
      floatingActionButton: actionButton(),
    );
  }
}
