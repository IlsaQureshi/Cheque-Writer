import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String _txt;
   TextWidget(this._txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Text(_txt,textAlign: TextAlign.center,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
    );
  }
}
