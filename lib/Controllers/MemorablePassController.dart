import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Preferences/Prefs.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/Splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class MemorablePassController extends GetxController
{
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  Future setMemo(String pass)async
  {
    try{
      isLoading.value=true;
      String p=Encrypt().encrypt_pass(pass);
      final ref=FirebaseDatabase.instance.ref("users").child(FirebaseAuth.instance.currentUser!.uid);
      ref.onValue.listen((event) async{
        await ref.child("ismpass").set(true);
        await ref.child("mpass").set(p);
      });

      await Prefs.setStat(true);
      await Prefs.setMemo(p);
      isLoading.value=false;
      Get.to(Splash());
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}