import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/ejercicios.dart';
import 'models/search_bar.dart';
import 'models/utils.dart';
import 'my_flutter_app_icons.dart';

class ListarEjercicios extends StatefulWidget {
  ListarEjercicios({Key? key, required this.title, required this.musculo_selected}) : super(key: key);
  final String title;
  final String musculo_selected;
  @override
  _ListarEjercicios createState() => _ListarEjercicios(musculo_selected);
}

class _ListarEjercicios extends State<ListarEjercicios> {
  _ListarEjercicios(this.musculo);

  final String musculo;

  List<Ejercicios> ejercicios = Utils.getEjercicios();
  Radius get radius => new Radius.circular(10);
  final TextEditingController myController = TextEditingController();

  final Style_letra = const TextStyle(fontSize: 20);

  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_listar_ejercicios);
  }

  void _listar_ejercicios() {
    print('Second text field: ${myController.text}');
  }
  @override
  Widget build(BuildContext context) {
    List<Ejercicios> nuevos_ejer = [];
    List<Ejercicios> nuevos_ejer_totales = [];
    for(var i = 0; i < ejercicios.length; i++){
      if (ejercicios[i].musculo.toString() == musculo){
        nuevos_ejer.add(ejercicios[i]);
        nuevos_ejer_totales.add(ejercicios[i]);
      }
    }
    print(nuevos_ejer);
    print(nuevos_ejer_totales);
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
                          hintText: 'Busca un ejercicio...'.toString(),
                        ),
                        onChanged: (text) {
                          print(nuevos_ejer);
                          for (var eje in nuevos_ejer_totales){
                            if (eje.name.toLowerCase().contains(myController.text.toLowerCase())){
                              bool inside = false;
                              int i = 0;
                              while (inside == false && i < nuevos_ejer.length){
                                if (nuevos_ejer[i].name == eje.name){
                                  inside = true;
                                }
                                i += 1;
                              }
                              if (inside == false){
                                setState(() {
                                  nuevos_ejer.add(eje);
                                });
                              }
                            }
                            else{
                              int i = 0;
                              bool deleted = false;
                              while (deleted == false && i < nuevos_ejer.length){
                                if (nuevos_ejer[i].name == eje.name){
                                  setState(() {
                                    nuevos_ejer.removeAt(i);
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