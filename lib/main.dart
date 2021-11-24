import 'package:flutter/material.dart';
import 'package:g_notes/calendario.dart';
import 'package:g_notes/estadistica.dart';
import 'package:g_notes/notas.dart';
import 'package:g_notes/inicio.dart';

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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Inicio'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes),
              label: "Notas"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_sharp),
              label: "Calendario"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_outlined),
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
