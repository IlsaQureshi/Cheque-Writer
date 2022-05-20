
import 'dart:async';
import 'dart:math';

import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/Login.dart';
import 'package:chequewallet/Views/MemorableInformation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Preferences/Prefs.dart';
import 'ChequeBg.dart';
import 'CreateMemorableInfo.dart';
import 'Email_Sent.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), _toLogin);

  }
  _toLogin()async
  {
    if(FirebaseAuth.instance.currentUser==null)
      Get.offAll(()=>Login());
    else  if(FirebaseAuth.instance.currentUser!=null && !FirebaseAuth.instance.currentUser!.emailVerified) {
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      Get.offAll(() => EmailSent());
    }
    else if(FirebaseAuth.instance.currentUser!=null && FirebaseAuth.instance.currentUser!.emailVerified)
      {
       bool val= await Prefs.getStat();
       if(val)
         {
           String value=await Prefs.getMemo();
           int num1,num2,num3;
           do {
             num1 = 4 + Random.secure().nextInt(Encrypt().DecryptPass(value).length-4);
             num2 = 4 + Random.secure().nextInt(Encrypt().DecryptPass(value).length-4);
             num3 = 4 + Random.secure().nextInt(Encrypt().DecryptPass(value).length-4);
           }while(num1==num2 || num2==num3 || num3==num1);

           Get.to(()=>MemorableInformation(num1,num2,num3));
         }
       else {
         Get.to(() => CreateMemorableInfo());
       }

      }
    else
      Get.offAll(()=>Dashboard());
  }


  @override
  Widget build(BuildContext context) {
    return ChequeBg(
      child: Scaffold(
        backgroundColor: Colors.transparent,
          body:
          Center(child: Image.asset("assets/Splash.png"))
      ),
    );
  }
}
