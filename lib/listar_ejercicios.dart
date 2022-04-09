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
              itemCount: ejercicios.length,
              itemBuilder: (BuildContext ctx, int index) {
                List<Ejercicios> nuevos_ejer = [];
                for(var i = 0; i< ejercicios.length; i++){
                  if (ejercicios[i].musculo.toString() == musculo){
                    nuevos_ejer.add(ejercicios[i]);
                  }
                }
                return InkWell(
                  child:
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    height: 150,
                    child: Stack(
                        children: [
                          Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'assets/' + nuevos_ejer[index].imgName,
                                    fit: BoxFit.cover
                                ),
                              )
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
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
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                      children: [
                                        const SizedBox(width: 8),
                                        Text(nuevos_ejer[index].name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 25
                                          ),
                                        )
                                      ]
                                  )
                              )
                          )
                        ]
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
        ],
      )
    );
  }
}