import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_notes/models/ejercicios.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/musculos.dart';
import 'models/utils.dart';
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

  String mu_selected = "Selecciona un músculo";
  String eje_selected = "Selecciona un ejercicio";

  List<Musculos> l_musculos = Utils.getMusculos();
  List<Ejercicios> l_ejercicios = Utils.getEjercicios("");
  List<String> nombres_musculos = [];

  static const double padding = 10;
  bool is_filtering_mu = false;
  bool is_filtering_eje = false;
  Radius get radius => new Radius.circular(10);
  @override
  Widget build(BuildContext context) {

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
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 50,
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                /*width: double.infinity,*/
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(radius),
                                    color: Colors.black
                                ),
                                constraints: const BoxConstraints(
                                    minHeight: 50,
                                    minWidth: double.infinity
                                ),
                                padding: const EdgeInsets.only(left: padding),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          mu_selected,
                                          style: GoogleFonts.oswald(
                                              textStyle: Style_letra,
                                              color: Colors.white),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                    Icon(
                                        is_filtering_mu ? MyFlutterApp.up_open:MyFlutterApp.down_open,
                                        color: Colors.white
                                    ),
                                    const Padding(padding: EdgeInsets.only(right: padding))
                                  ],
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  is_filtering_mu =! is_filtering_mu;
                                });
                              },
                            ),
                            InkWell(
                              child: Container(
                                /*width: double.infinity,*/
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(radius),
                                    color: Colors.black
                                ),
                                constraints: const BoxConstraints(
                                    minHeight: 50,
                                    minWidth: double.infinity
                                ),
                                padding: const EdgeInsets.only(left: padding),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          eje_selected,
                                          style: GoogleFonts.oswald(
                                              textStyle: Style_letra,
                                              color: Colors.white),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                    Icon(
                                      is_filtering_eje ? MyFlutterApp.up_open:MyFlutterApp.down_open,
                                      color: Colors.white
                                    ),
                                    const Padding(padding: EdgeInsets.only(right: padding))
                                  ],
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  is_filtering_eje =! is_filtering_eje;
                                });
                              },
                            )
                          ],
                        ),
                      )
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}