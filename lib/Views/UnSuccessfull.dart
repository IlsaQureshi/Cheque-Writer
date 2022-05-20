import 'package:chequewallet/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';

import '../Widgets/BottomButtons.dart';

class UnSuccessfull extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UnSuccessfull"),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            margin: EdgeInsets.all(20),
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/close.png")
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Text("Sorry something went wrong!",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ),
          TextWidget("The only file supported at the moment are PNG and JPEG files.")
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
