
import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Preferences/Prefs.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController
{
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  Future changeTransactionPass(String pass)async
  {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("users").child(FirebaseAuth.instance.currentUser!.uid);
      String enc=Encrypt().encrypt_pass(pass);
      await ref.child("transpass").set(enc);
      await Prefs.setTpass(enc);
      isLoading.value=false;
      Get.snackbar("success", "transaction password changed",backgroundColor: Colors.green.shade700,colorText: Colors.white);
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
  Future changePassword(String currentPassword, String newPassword) async {
    isLoading.value=true;
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user!.email!, password: currentPassword);

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        isLoading.value=false;
      Get.snackbar("success", "password changed",backgroundColor: Colors.green.shade700,colorText: Colors.white);
      }).catchError((error) {
        isLoading.value=false;
        ShowErrorAlert(error.toString());

      });
    }).catchError((err) {
      isLoading.value=false;
      ShowErrorAlert(err.toString());
    });}
}