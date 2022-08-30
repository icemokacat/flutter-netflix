import 'package:flutter/material.dart';
import 'package:flutter_netflix/screen/home_screen.dart';
import 'package:flutter_netflix/screen/more_screen.dart';
import 'package:flutter_netflix/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'LetsFlix',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          accentColor: Colors.white,
        ),
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  const HomeScreen(),
                  Container(
                    child: Center(
                      child: Text('search'),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text('save'),
                    ),
                  ),
                  const MoreScreen()
                ],
              ),
              bottomNavigationBar: const Bottom(),
            )));
  }
}
