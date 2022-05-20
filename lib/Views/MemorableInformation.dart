// ignore_for_file: prefer_const_constructors

import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../Preferences/Prefs.dart';
import 'BottomButtons.dart';
import 'ForgetMemorableInformation.dart';

class MemorableInformation extends StatelessWidget {
  int num1, num2, num3;
  MemorableInformation(this.num1, this.num2, this.num3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset("assets/Splash.png"),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Enter the following characters from memorable information to log on ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Pin_boxes(context, (String value) async {
              String p = await Prefs.getMemo();
              String pass = Encrypt().DecryptPass(p);
              if (pass.characters.characterAt(num1 - 1) ==
                      value.characters.characterAt(0) &&
                  pass.characters.characterAt(num2 - 1) ==
                      value.characters.characterAt(1) &&
                  pass.characters.characterAt(num3 - 1) ==
                      value.characters.characterAt(2)) {
                Get.offAll(() => Dashboard());
              } else
                ShowErrorAlert("Invalid info");
            }),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Forget your logon details?",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                InkWell(
                    onTap: () {
                      Get.to(() => ForgetMemorableInformation());
                    },
                    child: Text(
                      "Click Here",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    )),
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomButtons(onBack: (){}, onNext:(){}),
    );
  }

  Widget Pin_boxes(BuildContext context, var oncomplete) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                       margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                  "${num1}th",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: Text("${num2}th",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)))),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("${num3}th",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)))),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: PinCodeTextField(
              appContext: context,
              length: 3,
              obscureText: false,
              pinTheme: PinTheme(
                activeColor: Colors.black,
                inactiveColor: Colors.black,
                selectedColor: Colors.blue,
                shape: PinCodeFieldShape.box,
                fieldHeight: 80,
                fieldWidth: MediaQuery.of(context).size.width / 5,
                activeFillColor: Colors.black,
              ),
              onCompleted: oncomplete,
              onChanged: (String value) {},
            ),
          ),
        ],
      ),
    );
  }

  // Box code

}
