import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:g_notes/models/ejercicios.dart';
import 'package:g_notes/notas.dart';
import 'listar_ejercicios.dart';
import 'models/musculos.dart';
import 'models/utils.dart';
import 'models/constants.dart';
import 'my_flutter_app_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:g_notes/models/search_bar.dart';
import 'main.dart';

class Inicio extends StatefulWidget {
  Inicio({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _Inicio createState() => _Inicio();
}

class _Inicio extends State<Inicio> {

  int _selected_musculo = 0;
  List<Musculos> musculos = Utils.getMusculos();

  List<Ejercicios> ejercicios = Utils.getEjercicios("");
  List<Ejercicios> ejercicios_completos = Utils.getEjercicios("");

  String musculo_selected = '';
  String ejercicio_selected = '';

  final TextEditingController myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_listar_ejercicios);
  }

  void _listar_ejercicios() {
    print('Second text field: ${myController.text}');
  }

  /// Clasificacion de musculos
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
            MyFlutterApp.dumbbell,
            color: Colors.black,
            size: 40
        ),
        centerTitle: true,
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
                                padding: const EdgeInsets.all(padding),
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
                  List<Ejercicios> List1 = Utils.getEjercicios(musculo_selected);
                  List<Ejercicios> List2 = Utils.getEjercicios(musculo_selected);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListarEjercicios(title: '', musculo_selected: musculo_selected, List1: List1, List2: List2)));
                },
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
                            for (var eje in ejercicios_completos){
                               if (eje.name.toLowerCase().contains(myController.text.toLowerCase())){
                                 bool inside = false;
                                 int i = 0;
                                 while (inside == false && i < ejercicios.length){
                                   if (ejercicios[i].name == eje.name){
                                     inside = true;
                                   }
                                   i += 1;
                                 }
                                 if (inside == false){
                                   setState(() {
                                     ejercicios.add(eje);
                                   });
                                 }
                               }
                               else{
                                 int i = 0;
                                 bool deleted = false;
                                 while (deleted == false && i < ejercicios.length){
                                   if (ejercicios[i].name == eje.name){
                                      setState(() {
                                        ejercicios.removeAt(i);
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
                    itemCount: ejercicios.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(radius),
                              color: Colors.black
                          ),
                          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          padding: const EdgeInsets.only(left: padding),
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
                        onTap: () {
                          ejercicio_selected = ejercicios[index].name;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Notas(title: '', ejercicio: ejercicio_selected, lista_notas: [],)));
                        },
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
