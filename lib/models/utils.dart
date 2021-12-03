import 'package:flutter/material.dart';
import 'package:g_notes/models/ejercicios.dart';
import 'package:g_notes/models/musculos.dart';

class Utils{
  static List<Musculos> getMusculos(){
    return [
      Musculos(
          name: 'Pecho',
          icon: 'iconPecho',
          color: Colors.blueAccent,
          imgName: 'pecho.jpg'
      ),
      Musculos(
          name: 'Espalda',
          icon: 'iconEspalda',
          color: Colors.blueAccent,
          imgName: 'espalda.jpeg'
      ),
      Musculos(
          name: 'Biceps',
          icon: 'iconBiceps',
          color: Colors.blueAccent,
          imgName: 'biceps.png'
      ),
      Musculos(
          name: 'Triceps',
          icon: 'iconTriceps',
          color: Colors.blueAccent,
          imgName: 'triceps.jpg'
      ),
      Musculos(
          name: 'Hombro',
          icon: 'iconHombro',
          color: Colors.blueAccent,
          imgName: 'hombro.jpeg'
      ),
      Musculos(
          name: 'Pierna',
          icon: 'iconPierna',
          color: Colors.blueAccent,
          imgName: 'pierna.jpg'
      ),
      Musculos(
          name: 'Abdomen',
          icon: 'iconAbdomen',
          color: Colors.blueAccent,
          imgName: 'abdomen.jpg'
      )
    ];
  }

  static List<Ejercicios> getEjercicios(){
    return [
      Ejercicios(
          name: 'Press banca horizontal',
          color: Colors.blueAccent,
          imgName: 'pressh.png',
          musculo: 'Pecho'
      ),
      Ejercicios(
          name: 'Press banca horizontal con mancuernas',
          color: Colors.blueAccent,
          imgName: 'presshm.jpg',
          musculo: 'Pecho'
      ),
      Ejercicios(
          name: 'Press banca inclinado',
          color: Colors.blueAccent,
          imgName: 'pressi.png',
          musculo: 'Pecho'
      ),
      Ejercicios(
          name: 'Press banca inclinado con mancuernas',
          color: Colors.blueAccent,
          imgName: 'pressim.jpg',
          musculo: 'Pecho'
      ),
      Ejercicios(
          name: 'Press banca declinado',
          color: Colors.blueAccent,
          imgName: 'pressd.png',
          musculo: 'Pecho'
      ),
      Ejercicios(
          name: 'Press banca declinado con mancuernas',
          color: Colors.blueAccent,
          imgName: 'pressdm.png',
          musculo: 'Pecho'
      ),
      ///Ejercicios(
      ///name: 'Contractora',
      ///color: Colors.blueAccent,
      ///imgName: 'contractora.jpg',
      ///musculo: getMusculos()[0]
      ///),
      ///Ejercicios(
          ///name: 'Rompecráneos',
          ///color: Colors.blueAccent,
          ///imgName: 'rompecraneos.jpg',
          ///musculo: getMusculos()[3]
      ///),
    ];
  }
}