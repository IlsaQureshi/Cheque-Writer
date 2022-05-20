
import 'dart:convert';

import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/ManageAccounts.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class AddBankAccountController extends GetxController
{
   var isLoading=false.obs;
   var client=http.Client();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  Future addBankAccount(
      {
        required String fname,
        required String middlename,
        required String lname,
        required String Dob,
        required String accountNumber,
        required String sortCode,
        required String bank
      })async
  {
    try{
      isLoading.value=true;
      String url="https://tls.bankaccountchecker.com/listener.php?key=c284939c107fb03fac17aa15ae6bed4b&password=Chequewallet1@&output=json&type=uk_bankaccount&sortcode=${Encrypt().DecryptPass(sortCode)}&bankaccount=${accountNumber}";
      final ref=FirebaseDatabase.instance.ref("bankAccounts");
      var respponce=await client.get(Uri.parse(url));
      // print(respponce.body);
      var resultCode=jsonDecode(respponce.body)['resultCode'];
      if(resultCode=="01") {
        var payload={
          'fname':fname,
          'middlename':middlename,
          'lname':lname,
          'dob':Dob,
          'accountNumber':accountNumber,
          'sortCode':sortCode,
          'bank':bank,
        };
        await ref.child(FirebaseAuth.instance.currentUser!.uid).push().set(payload);
        isLoading.value = false;
        Get.off(()=>ManageAccounts());
      }
      else
        throw "Invalid bank Details";
    }catch(e)
    {
      isLoading.value=false;
     ShowErrorAlert(e.toString());
    }
  }
}