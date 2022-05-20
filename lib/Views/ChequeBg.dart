import 'package:flutter/material.dart';

class ChequeBg extends StatelessWidget {
  Widget child;

  ChequeBg({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("assets/bg.png",fit: BoxFit.fill,),
        child,
      ],
    );
  }
}
