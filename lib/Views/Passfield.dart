import 'package:flutter/material.dart';

  Widget Passfield(
    String name,
    String hinttext,
    double fieldleft,
    double fieldright,
    final controll,
  ) {
    return Container(
        margin: EdgeInsets.only(left: fieldleft, right: fieldright),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${name}\n",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: controll,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 30.0,
                        style: BorderStyle.solid)),
                hintText: hinttext,
              ),
            ),
          ],
        ));
  }
