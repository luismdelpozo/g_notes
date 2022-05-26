import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_flutter_app_icons.dart';

class Notas extends StatefulWidget {
  Notas({Key? key, required this.title, required this.ejercicio, required this.lista_notas}) : super(key: key);
  final String title;
  final String ejercicio;
  final List<Notas> lista_notas;

  @override
  _Notas createState() => _Notas(ejercicio, lista_notas);
}

class _Notas extends State<Notas> {
  _Notas(this.ejercicio, this.lista_notas);

  final String ejercicio;
  final List<Notas> lista_notas;

  final Style_letra = const TextStyle(fontSize: 20);
  final Style_letra_small = const TextStyle(fontSize: 10);
  String _ejer = "";

  Radius get radius => new Radius.circular(10);
  @override
  Widget build(BuildContext context) {
    if (ejercicio.isEmpty){
      _ejer = "Notas";
    }
    else{
      _ejer = ejercicio;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Icon(
            MyFlutterApp.dumbbell,
            color: Colors.black,
            size: 40
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text(_ejer.toString().trim(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.oswald(textStyle: Style_letra)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Músculo".toString().trim(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.oswald(textStyle: Style_letra)
              ),
            ),
            InkWell(
              child: Container(

              ),
              onTap: (){

              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Ejercicio".toString().trim(),
                  textAlign: TextAlign.left,
                  style: GoogleFonts.oswald(textStyle: Style_letra)
              ),
            ),
            InkWell(
              child: Container(

              ),
              onTap: (){

              },
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: lista_notas.length,
                    itemBuilder: (BuildContext ctx, int index){
                      return InkWell();
                    }
                )
            )
          ],
        ),
      )
    );
  }
}