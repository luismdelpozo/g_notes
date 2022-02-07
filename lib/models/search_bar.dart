import 'package:flutter/material.dart';

class SearchBarWiget extends StatelessWidget{
  @override
  Radius get radius => new Radius.circular(20);
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(radius),
      ),
      child: TextField(),
    );
  }
}