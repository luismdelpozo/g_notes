import 'package:flutter/material.dart';

import 'models/musculos.dart';
import 'models/utils.dart';
import 'my_flutter_app_icons.dart';

class Notas extends StatelessWidget {
  List<Musculos> musculos = Utils.getMusculos();

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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Selecciona un músculo',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: musculos.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: const EdgeInsets.all(20),
                    height: 150,
                    child: Stack(
                        children: [
                          Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                    'assets/' + musculos[index].imgName,
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
                                        //ClipOval(
                                        //child: Container(
                                        //  color: musculos[index].color,
                                        //padding: const EdgeInsets.all(10),
                                        //child: Icon(
                                        //MyFlutterApp.dumbbell,
                                        //color: Colors.white,
                                        //size: 20
                                        //)
                                        //),
                                        //),
                                        const SizedBox(width: 8),
                                        Text(musculos[index].name,
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}