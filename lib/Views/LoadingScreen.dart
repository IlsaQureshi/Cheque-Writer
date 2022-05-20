import 'package:chequewallet/Views/ChequeBg.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChequeBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
