import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_notes/models/ejercicios.dart';
import 'listar_ejercicios.dart';
import 'models/musculos.dart';
import 'models/utils.dart';
import 'my_flutter_app_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:g_notes/models/search_bar.dart';

class Inicio extends StatelessWidget {
  int _selected_musculo = 0;
  List<Musculos> musculos = Utils.getMusculos();
  List<Ejercicios> ejercicios = Utils.getEjercicios();

  final Style_letra = const TextStyle(fontSize: 20);
  final Style_letra_small = const TextStyle(fontSize: 10);
  Radius get radius => new Radius.circular(20);
  String musculo_selected = '';

  /// Clasificacion de musculos
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 20),
                child: Text('Músculo recomendado:',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.oswald(textStyle: Style_letra)
                  ),
                ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 230,
                  child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(radius),
                            child: Image.asset(
                                'assets/' + musculos[_selected_musculo].imgName,
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(radius),
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.black.withOpacity(0.7),
                                        Colors.transparent
                                      ]
                                  )
                              ),
                            )
                        ),
                        Positioned(
                            bottom: 0,
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                    children: [
                                      const SizedBox(width: 8),
                                      Text(musculos[_selected_musculo].name,
                                          style: GoogleFonts.oswald(
                                              textStyle: Style_letra,
                                              color: Colors.white)
                                      )
                                    ]
                                )
                            )
                        ),
                      ]
                  ),
                ),
                onTap: (){
                  musculo_selected = musculos[_selected_musculo].name;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListarEjercicios(musculo_selected)));
                },
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: SearchBarWidget('Busca un ejercicio...'),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    itemCount: ejercicios.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return InkWell(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black
                            ),
                            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(ejercicios[index].name,
                                    style: GoogleFonts.oswald(
                                        textStyle: Style_letra,
                                        color: Colors.white),
                                    textAlign: TextAlign.left
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                      MyFlutterApp.dumbbell,
                                      color: Colors.white
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(right: 20))
                              ],
                            ),
                          ),
                      onTap: () {},
                      );
                    },
                  )
              )
            ],
          ),
       ),
    );
  }
}