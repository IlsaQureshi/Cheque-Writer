import 'package:chequewallet/Controllers/MemorablePassController.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BottomButtons.dart';
import 'ForgetMemorableInformation.dart';

class CreateMemorableInfo extends StatelessWidget {
  CreateMemorableInfo({Key? key}) : super(key: key);

  ForgetMemorableInformation obj1 = ForgetMemorableInformation();
  final memorable_information = TextEditingController();
  final reenter_memorable_information = TextEditingController();
  var _c=Get.put(MemorablePassController());
  @override
  Widget build(BuildContext context) {
    return GetX<MemorablePassController>(builder: (_) {
      return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
        appBar: AppBar(
          title: Text(
            "create memorable information",
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Your Memorable Information Forms Part Of Your LogonDetails And Should Be a Word Or A Mixture Of Letters And Numbers Known Only To You",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "For Security You You Will be Asked For 3 Randomly Chosen Characters From Your Memorable Information When You Will Log On.",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              SizedBox(height: 20),
              Image.asset("assets/Capture.PNG"),
              SizedBox(height: 60),
              obj1.TextField1(
                  "MEMORABLE INFORMATION", "", 20, 20, memorable_information),
              SizedBox(height: 40),
              obj1.TextField1("RE-ENTER MEMORABLE INFORMATION", "", 20, 20,
                  reenter_memorable_information),
            ],
          ),
        ),
        bottomNavigationBar: BottomButtons(
          onBack: () {
            Get.off(()=>SignUp());
          },
          onNext: () async {
            if (memorable_information.text.length < 8 && memorable_information.text.length > 18)
              ShowErrorAlert("info should be between 8-18 characters ");
            else if (memorable_information.text.contains(' '))
              ShowErrorAlert("Info shoudld not contain spaces");
            if (memorable_information.text !=
                reenter_memorable_information.text)
              ShowErrorAlert("Info deos not match");
            else
              await _.setMemo(memorable_information.text);
          },
          rightIcon: Icons.navigate_next,
          leftIcon: Icons.keyboard_arrow_left,
          leftTitle: "Back",
          rightTitle: 'Create',
        ),
      );
    });
  }
}
