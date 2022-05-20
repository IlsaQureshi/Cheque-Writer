
import 'dart:convert';
import 'dart:math';

import 'package:chequewallet/Model/UserModel.dart';
import 'package:chequewallet/Preferences/Prefs.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Encryption/Encrypt.dart';
import '../Validation/Validation.dart';
import '../Views/CreateMemorableInfo.dart';
import '../Views/Email_Sent.dart';
import '../Views/MemorableInformation.dart';

var userModel=UserModel(fname: "", lname: "", dob: "", transpass: "", email: "",ismpass: false,mpass: "").obs;
class LoginController extends GetxController
{
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  Future Login(String email,String pass)async
  {
    try{
      isLoading.value=true;
     UserCredential uc= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).timeout(Duration(seconds: 15),onTimeout: (){
        throw "connection timeout";
      });
      if(uc.user!=null)
        {
          await getUserData();
          isLoading.value=false;
          if(uc.user!.emailVerified)
          _toLogin();
          else{
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
            Get.offAll(()=>EmailSent());
          }


        }
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }

  Future getUserData()async
  {
    try{
      final ref=FirebaseDatabase.instance.ref("users");
      var data=await ref.child(FirebaseAuth.instance.currentUser!.uid).once();
      userModel.value=userModelFromJson(jsonEncode(data.snapshot.value));
      print(jsonEncode(data.snapshot.value));
      await Prefs.setMemo(userModel.value.mpass);
      await Prefs.setStat(userModel.value.ismpass);
      await Prefs.setTpass(userModel.value.transpass);

    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }

  _toLogin()async
  {
     if(FirebaseAuth.instance.currentUser!=null && !FirebaseAuth.instance.currentUser!.emailVerified) {
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
}
