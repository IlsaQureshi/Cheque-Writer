

import 'dart:io';

import 'package:chequewallet/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../Widgets/BottomButtons.dart';

class UploadSignature2 extends StatelessWidget {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Signature"),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            margin: EdgeInsets.only(top: 50,left: 20,right: 20),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
              border: Border.all(color: Colors.grey,width: 4),
            ),
            child: Center(
              child: Text("Preview",style: TextStyle(fontSize: 25),),
            ),
          ),
          TextWidget("image1.jpg"),
          SizedBox(height: 20,),
          TextWidget("Do you wish to continue or try with another image file?"),
        ],
      ),
      bottomNavigationBar: BottomButtons(
        leftTitle: "Try again",
        leftIcon: Icons.repeat,
        onBack: (){},
        rightTitle: "Continue",
        rightIcon: Icons.keyboard_arrow_right,
        onNext: (){},
      ),
    );
  }
}
