import 'dart:ui';


import 'package:chequewallet/Views/Login.dart';
import 'package:chequewallet/Views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/BottomButtons.dart';

class email_verification extends StatelessWidget {
  const email_verification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:

      AppBar(title: Text("Email Verification",
        style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body:
      SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 30),
            Container(
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black,width: 4)
                ),


            ),

            SizedBox(height: 30),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Text("We Have Sent You A Email !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                )
            ),

            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Text("An Email Verification link has been sent to your email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),

                )
            ),


            SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtons(onBack: (){
        Get.off(()=>Login());
        }, onNext:(){
          // Get.off(()=>SignUp());
        }, rightIcon: Icons.arrow_forward_ios, leftIcon: Icons.arrow_back_ios, leftTitle: 'Back', rightTitle: 'SignUp',),
    );
  }
}
