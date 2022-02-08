import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget{

  Radius get radius => new Radius.circular(20);
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(radius),
      ),
      child: const TextField(
        cursorColor: Colors.black26,
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            size: 30,
            color: Colors.black26,
          ),
          suffixIcon: Icon(
            Icons.tune,
            size: 30,
            color: Colors.black26,
          ),
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.black26,
            fontSize: 18
          ),
          hintText: 'Busca un ejercicio...'
        ),
      ),
    );
  }
}