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
  final Style_letra_small = const TextStyle(fontSize: 17);

  String _ejer = "";

  String mu_selected = "Selecciona un músculo";
  String eje_selected = "Selecciona un ejercicio";

  List<Musculos> l_musculos = Utils.getMusculos();
  List<Ejercicios> l_ejercicios = Utils.getEjercicios("");
  List<String> nombres_musculos = [];

  static const double padding = 10;
  bool is_filtering_mu = false;
  bool is_filtering_eje = false;
  int elems_lista = 0;
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
        padding: const EdgeInsets.symmetric(vertical: padding, horizontal: padding),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(radius),
                            color: Colors.black
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(radius),
                                    color: Colors.black
                                ),
                                constraints: const BoxConstraints(
                                    minHeight: 50,
                                    minWidth: double.infinity
                                ),
                                padding: const EdgeInsets.only(left: padding, right: 17.5),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(mu_selected,
                                          style: GoogleFonts.oswald(
                                              textStyle: Style_letra,
                                              color: Colors.white),
                                          textAlign: TextAlign.left
                                      ),
                                    ),
                                    Icon(
                                      is_filtering_mu ? MyFlutterApp.down_open:MyFlutterApp.up_open,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  is_filtering_mu =! is_filtering_mu;
                                  if (elems_lista == 0){
                                    elems_lista = l_musculos.length;
                                  }
                                  else{
                                    elems_lista = 0;
                                  }
                                });
                              },
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: elems_lista,
                    itemBuilder: (BuildContext ctx, int index) {
                      return InkWell(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white38,
                          ),
                          margin: const EdgeInsets.only(bottom: 5, top: 5),
                          padding: const EdgeInsets.only(left: padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(l_musculos[index].name,
                                    style: GoogleFonts.oswald(
                                        textStyle: Style_letra_small,
                                        color: Colors.black),
                                    textAlign: TextAlign.left
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                    MyFlutterApp.dumbbell,
                                    color: Colors.black
                                ),
                              ),
                              const Padding(padding: EdgeInsets.only(right: 20))
                            ],
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            mu_selected = l_musculos[index].name;
                            is_filtering_mu =! is_filtering_mu;
                            if (elems_lista == 0){
                              elems_lista = l_musculos.length;
                            }
                            else{
                              elems_lista = 0;
                            }
                          });
                        },
                      );
                    },
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}