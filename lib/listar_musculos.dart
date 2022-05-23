import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'api_functions.dart';
import 'listar_ejercicios.dart';
import 'models/musculos.dart';
import 'models/utils.dart';
import 'my_flutter_app_icons.dart';
import 'models/search_bar.dart';

class ListarMusculos extends StatefulWidget {
  ListarMusculos({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _ListarMusculos createState() => _ListarMusculos();
}

class _ListarMusculos extends State<ListarMusculos> {
  String url = '';
  var data;
  String musculo_selected = '';
  String output = 'Initial output';
  List<Musculos> musculos = Utils.getMusculos();
  List<Musculos> musculos_completos = Utils.getMusculos();
  Radius get radius => new Radius.circular(10);
  final TextEditingController myController = TextEditingController();
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
            child: Text('Selecciona un músculo',
              textAlign: TextAlign.center,
              style: GoogleFonts.oswald(textStyle: Style_letra)
            ),
          ),
          InkWell(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(radius),
                      ),
                      child: TextField(
                        controller: myController,
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            size: 30,
                            color: Colors.black26,
                          ),
                          suffixIcon: const Icon(
                            Icons.tune,
                            size: 30,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                              color: Colors.black26,
                              fontSize: 18
                          ),
                          hintText: 'Busca un músculo...'.toString(),
                        ),
                        onChanged: (text) {
                          for (var mus in musculos_completos){
                            if (mus.name.toLowerCase().contains(myController.text.toLowerCase())){
                              bool inside = false;
                              int i = 0;
                              while (inside == false && i < musculos.length){
                                if (musculos[i].name == mus.name){
                                  inside = true;
                                }
                                i += 1;
                              }
                              if (inside == false){
                                setState(() {
                                  musculos.add(mus);
                                });
                              }
                            }
                            else{
                              int i = 0;
                              bool deleted = false;
                              while (deleted == false && i < musculos.length){
                                if (musculos[i].name == mus.name){
                                  setState(() {
                                    musculos.removeAt(i);
                                  });
                                  deleted = true;
                                }
                                i += 1;
                              }
                            }
                          }
                        },
                      ),
                    )
                )
              ],
            ),
          ),
          // Container(
          //   child: Column(children: [
          //     TextField(
          //       onChanged: (value){
          //         url = 'http://10.0.2.2:5000/home?query=' + value.toString();
          //       },
          //     ),
          //     TextButton(
          //         onPressed: () async {
          //           data = await fetchData(url);
          //           var decoded = jsonDecode(data);
          //           print(decoded);
          //         },
          //         child: Text('Call api')
          //     ),
          //     Text(output)
          //   ],)
          // ),
          Expanded(
              child: ListView.builder(
                itemCount: musculos.length,
                itemBuilder: (BuildContext ctx, int index) {
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
                                          const SizedBox(width: 8),
                                          Text(musculos[index].name,
                                            style: GoogleFonts.oswald(textStyle: Style_letra, color: Colors.white)
                                          )
                                        ]
                                    )
                                )
                            )
                          ]
                      ),
                    ),
                    onTap: (){
                      musculo_selected = musculos[index].name;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListarEjercicios(title: '', musculo_selected: musculo_selected)));
                    },
                  );
                },
              ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}