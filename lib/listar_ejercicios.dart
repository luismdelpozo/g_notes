import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/ejercicios.dart';
import 'models/search_bar.dart';
import 'models/utils.dart';
import 'my_flutter_app_icons.dart';

class ListarEjercicios extends StatelessWidget {
  ListarEjercicios(this.musculo);

  final String musculo;

  List<Ejercicios> ejercicios = Utils.getEjercicios();

  final Style_letra = const TextStyle(fontSize: 20);
  @override
  Widget build(BuildContext context) {
    List<Ejercicios> nuevos_ejer = [];
    for(var i = 0; i < ejercicios.length; i++){
      if (ejercicios[i].musculo.toString() == musculo){
        nuevos_ejer.add(ejercicios[i]);
      }
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Ejercicios de ' + musculo.toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.oswald(textStyle: Style_letra)
            ),
          ),
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: SearchBarWidget('Busca un ejercicio de ' + musculo.toString() + '...'),
                ),
                ]
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: nuevos_ejer.length,
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
                          child: Text(nuevos_ejer[index].name,
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
                  onTap: (){
                    ///musculo_selected = musculos[index].name;
                    ///Navigator.push(context, MaterialPageRoute(builder: (context) => ListarEjercicios(musculo_selected)));
                  },
                );
              },
            ),
          ),
          InkWell(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
                color: Colors.white
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('  Volver',
                              style: GoogleFonts.oswald(
                              textStyle: Style_letra,
                              color: Colors.black),
                              textAlign: TextAlign.left
                          ),
                    ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      MyFlutterApp.undo,
                      color: Colors.black
                      ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 20))
                  ],
              ),
            ),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      )
    );
  }
}