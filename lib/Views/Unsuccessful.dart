

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/bottom_buttons.dart';
import 'Cheque_Created.dart';
import 'Email_Sent.dart';


import 'Email_Sent.dart';

class Unsuccessful extends StatelessWidget {
  const Unsuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Unsuccessful'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: Image.asset(
                    'assets/close.png',
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Sorry something went wrong!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Please Check your internet Connection and',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Try Again!',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                BottomButtons(
                    Icons.cancel,
                    'Cancel',
                    () {
                      Get.to(() => EmailSent());
                    },
                    'Try Again!',
                    Icons.repeat,
                    () {
                      Get.to(() => ChequeCreated());
                    },
                    150),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
