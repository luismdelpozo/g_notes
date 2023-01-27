import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_flutter_app_icons.dart';

void main() {
  runApp(MyAppLogin());
}


class MyAppLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Gimnasio',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  final TextEditingController myController = TextEditingController();
  final Style_letra = const TextStyle(fontSize: 20);
  Radius get radius => new Radius.circular(10);

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
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                  alignment: Alignment.center,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onSaved: (email) {},
                    keyboardAppearance: Brightness.dark,
                    style: GoogleFonts.oswald(textStyle: Style_letra),
                    cursorColor: Colors.transparent,
                    decoration:  InputDecoration(
                      hintText: "Usuario",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Container(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    onSaved: (password) {},
                    keyboardAppearance: Brightness.dark,
                    style: GoogleFonts.oswald(textStyle: Style_letra),
                    decoration: const InputDecoration(
                        hintText: "Contraseña",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock, color: Colors.black)
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )
                  )
              ),
            ),
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
                  onTap: (){},
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
        ),
      )
    );
  }
}