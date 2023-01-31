import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g_notes/login.dart';
import 'package:g_notes/register_user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_flutter_app_icons.dart';
import 'package:g_notes/models/constants.dart';

void main() {
  runApp(MyAppInit());
}

class MyAppInit extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Gimnasio',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Init(),
    );
  }
}

class Init extends StatefulWidget {
  const Init({Key? key}) : super(key: key);
  @override
  State<Init> createState() => _Init();
}

class _Init extends State<Init> {
  @override
  final TextEditingController myController = TextEditingController();

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          Text("Bienvenido/a a Gym Notes!",
            style: GoogleFonts.oswald(textStyle: Style_letra_titulo),
            textAlign: TextAlign.left,
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(radius),
                              color: Colors.black
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('Iniciar sesión',
                                    style: GoogleFonts.oswald(
                                        textStyle: Style_letra,
                                        color: Colors.white),
                                    textAlign: TextAlign.left
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                        },
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: InkWell(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(radius),
                              color: Colors.black
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text('Registrarte',
                                    style: GoogleFonts.oswald(
                                        textStyle: Style_letra,
                                        color: Colors.white),
                                    textAlign: TextAlign.left
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                        },
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:100),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.copyright, color: Colors.black),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Text("LM productions",
                          style: GoogleFonts.oswald(
                              textStyle: Style_letra,
                              color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}