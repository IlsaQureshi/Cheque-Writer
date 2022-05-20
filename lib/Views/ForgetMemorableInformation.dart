import 'package:chequewallet/Controllers/ForgetMemorableController.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';
import 'BottomButtons.dart';

class ForgetMemorableInformation extends StatelessWidget {
  ForgetMemorableInformation();

  final pass = TextEditingController();
  final memorable_info = TextEditingController();
  final rememorable_info = TextEditingController();
  var _c=Get.put(ForgetMemorableController());

  @override
  Widget build(BuildContext context) {
    return GetX<ForgetMemorableController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text(
              "Forget Memorable Information",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Container(
                    child: Text(
                  "Enter your Account password",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
                SizedBox(height: 20),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 7),
                    child: Text(
                      "we will authenticate you first, if authentication is successfull then your info will be changed",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(height: 30),
                TextField1(
                  "Account Password",
                  "Enter Your Account password",
                  20,
                  20,
                  pass,
                ),
                SizedBox(height: 20),
                TextField1(
                  "New Memorable",
                  "New Memorable info",
                  20,
                  20,
                  memorable_info,
                ),
                SizedBox(height: 20),
                TextField1(
                  "Confirm Memorable",
                  "Confirm info",
                  20,
                  20,
                  rememorable_info,
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomButtons(
            onBack: () {
              Get.off(()=>Login());
            },
            onNext: () async {
              if (memorable_info.text.length < 8 && memorable_info.text.length < 18)
                ShowErrorAlert("info should be between 8-18 characters ");
              else if (memorable_info.text.contains(' '))
                ShowErrorAlert("Info should not contain spaces");
              if (memorable_info.text != rememorable_info.text)
                ShowErrorAlert("Info does not match");
              else
                await _.change(pass.text, memorable_info.text);
            },
            rightIcon: null,
            leftIcon: null,
            leftTitle: 'Back',
            rightTitle: 'Next',
          ),
        );
      }
    );
  }

  Widget TextField1(
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
}
