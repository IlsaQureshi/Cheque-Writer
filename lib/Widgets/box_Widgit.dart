import 'package:flutter/material.dart';

class BoxWidgit extends StatelessWidget {
  String txt;

  BoxWidgit(this.txt);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.0),
        ),
        child: Center(
          child: Text(txt),
        ));
  }
}
