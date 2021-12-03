import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_notes/models/ejercicios.dart';
import 'models/musculos.dart';
import 'models/utils.dart';
import 'my_flutter_app_icons.dart';

class Inicio extends StatelessWidget {
  int _selected_musculo = 0;
  List<Musculos> musculos = Utils.getMusculos();
  List<Ejercicios> ejercicios = Utils.getEjercicios();

  //List<Ejercicios> crearListaBuena(){
    //List<Ejercicios> ejerciciosCorrectos = [];
    //for(int i = 0; i < ejercicios.length; i++){
      //if (ejercicios[i].musculo.name == musculos[_selected_musculo].name){
        //ejerciciosCorrectos.add(ejercicios[i]);
      //}
    //}
    //return ejerciciosCorrectos;
  //}

  //List<Ejercicios> ejercicios_correctos = Inicio().crearListaBuena();

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
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Hoy toca hacer:',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black),
                  ),
                ),
              Container(
                margin: const EdgeInsets.all(20),
                height: 230,
                width: 150,
                child: Stack(
                    children: [
                      Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                'assets/' + musculos[_selected_musculo].imgName,
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
                                    Text(musculos[_selected_musculo].name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25
                                      ),
                                    )
                                  ]
                              )
                          )
                      ),
                    ]
                ),
              ),
              Expanded(
                  child: ListView.builder(
                    ///scrollDirection: Axis.horizontal,
                    itemCount: ejercicios.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Container(
                        margin: const EdgeInsets.all(20),
                        height: 100,
                        child: Stack(
                            children: [
                              Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                        'assets/' + ejercicios[index].imgName,
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
                                            Text(ejercicios[index].name,
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