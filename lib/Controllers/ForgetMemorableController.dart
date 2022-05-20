
import 'package:chequewallet/Preferences/Prefs.dart';
import 'package:chequewallet/Views/Splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Encryption/Encrypt.dart';
import '../Validation/Validation.dart';

class ForgetMemorableController extends GetxController
{
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  Future change(String currentPassword,String memo)async
  {
    isLoading.value=true;
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      final ref=FirebaseDatabase.instance.ref("users").child(value.user!.uid);
      ref.child("transpass").set(Encrypt().encrypt_pass(memo)).then((value)async{
        await Prefs.setMemo(memo);
        isLoading.value=false;
        Get.snackbar("success", "memorable info reset",backgroundColor: Colors.green.shade700,colorText: Colors.white);
        Get.offAll(()=>Splash());
      }).catchError((onError){
        isLoading.value=false;
        ShowErrorAlert(onError.toString());

      });
    }).catchError((err) {
      isLoading.value=false;
      ShowErrorAlert(err.toString());
    });}
}