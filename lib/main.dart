import 'package:flutter/material.dart';
import 'package:g_notes/calendario.dart';
import 'package:g_notes/estadistica.dart';
import 'package:g_notes/notas.dart';
import 'package:g_notes/inicio.dart';

import 'my_flutter_app_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Gimnasio',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Gimnasio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index_page = 0;

  List<Widget> _widgetOptions = <Widget>[
    Inicio(),
    Notas(),
    Calendario(),
    Estadistica(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index_page,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black87,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Inicio'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_rounded),
              label: "Notas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: "Calendario"
          ),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.chart_area),
              label: "Estadística"
          )
        ],
        onTap: (index) {
          setState(() {
            index_page = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(index_page),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
