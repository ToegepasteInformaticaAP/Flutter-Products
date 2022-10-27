import 'package:flutter/material.dart';

import 'addscreen.dart';
import 'productscreen.dart';
import 'strings.dart' as strings;

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  static const List<Widget> _views = [
    ProductScreen(),
    AddScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.add)),
              ],
            ),
            title: const Text(strings.appTitle),
          ),
          body: const TabBarView(children: _views),
        ),
      ),
    );
  }
}
