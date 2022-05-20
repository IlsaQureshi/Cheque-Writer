import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  bool value;
  var ontap;
  String title;

  CheckBox({required this.value, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 50,
      child: Column(
        children: [
          Row(
            children: <Widget>[
              //SizedBox
              Checkbox(
                value: value,
                onChanged: ontap,
              ), //SizedBox
              Text(
                title,
                style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w700),
              ), //Checkbox
            ], //<Widget>[]
          ), //Row
        ],
      ), //Column
      //Padding
    );
  }
}
