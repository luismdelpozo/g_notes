import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget{
  var _textEditingController;

  SearchBarWidget(this.text_inside, this._textEditingController);
  final Style_letra = const TextStyle(fontSize: 18);
  final String text_inside;
  Radius get radius => new Radius.circular(10);
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(radius),
      ),
      child: TextField(
        controller: _textEditingController,
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
          hintText: text_inside.toString()
        ),
      ),
    );
  }
}