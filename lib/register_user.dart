import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'inicio.dart';
import 'main.dart';
import 'models/checkbox.dart';
import 'models/constants.dart';
import 'my_flutter_app_icons.dart';

void main() {
  runApp(MyAppRegister());
}

class MyAppRegister extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Gimnasio',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Register(),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  final TextEditingController myController = TextEditingController();
  bool _isObscure = true;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Crear usuario",
                style: GoogleFonts.oswald(textStyle: Style_letra_titulo)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text("Introduzca los sigiuentes datos",
                style: GoogleFonts.oswald(textStyle: Style_letra_small)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: buildInputForm('Nombre', false)
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: buildInputForm('Apellidos', false)
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: buildInputForm('Correo electrónico', false)
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: buildInputForm('Teléfono', false)
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: buildInputForm('Contraseña', true)
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: buildInputForm('Repite contraseña', true)
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CheckBox('Acepto términos y condiciones'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: CheckBox('Mantener sesión iniciada'),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
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
                          child: Text('Crear usuario',
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
  Padding buildInputForm(String hint, bool pass) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(
          obscureText: pass ? _isObscure : false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.oswald(
                textStyle: Style_letra,
                color: Colors.black),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            suffixIcon: pass
                ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: _isObscure
                    ? Icon(
                  Icons.visibility_off,
                  color: Colors.black,
                )
                    : Icon(
                  Icons.visibility,
                  color: Colors.black,
                ))
                : null,
          ),
        ));
  }
}



