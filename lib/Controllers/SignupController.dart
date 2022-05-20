
import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Preferences/Prefs.dart';
import 'package:chequewallet/SendEmail/SendEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';
import '../Views/Dashboard.dart';
import '../Views/Email_Sent.dart';

class SignupController extends GetxController
{
  Encrypt _encrypt=Encrypt();
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  Future validation(String Firstname,String lastname,String pass,String cpass,String Dob,String email,String transactionPass)async
  {
    String pattern=r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
    RegExp exp=new RegExp(pattern);

    if(exp.hasMatch(pass))
      {
        print('valid');
      }
  }

   Future doSignup(String Firstname,String lastname,String pass,String Dob,String email,String transactionPass)async
  {
    try{
      isLoading.value=true;
      print("false");
      UserCredential uc=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass);
      if(uc.user!=null)
        {
           await _uploadInfo(Firstname, lastname, Dob, email, transactionPass);
           if(uc.user!.emailVerified)
             Get.offAll(()=>Dashboard());
           else{
             await FirebaseAuth.instance.currentUser!.sendEmailVerification();
             Get.offAll(()=>EmailSent());
           }
        }
    }catch(e)
    {
      isLoading.value=false;
      print("false");
      Get.snackbar("Error", e.toString());
    }
  }

  Future _uploadInfo(String Firstname,String lastname,String Dob,String email,String transactionPass)async
  {
    try{
      final ref=FirebaseDatabase.instance.ref("users");
      String encpass=_encrypt.encrypt_pass(transactionPass);
      var payload={
        'fname':Firstname,
        'lname':lastname,
        'dob':Dob,
        'email':email,
        'transpass':encpass,
        'ismpass':false,
        'mpass':""
      };
      await ref.child(FirebaseAuth.instance.currentUser!.uid).set(payload);
      await Prefs.setMemo("");
      await Prefs.setStat(false);
      isLoading.value=false;
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}