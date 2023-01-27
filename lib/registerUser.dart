import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Container(),
    );
  }
}

