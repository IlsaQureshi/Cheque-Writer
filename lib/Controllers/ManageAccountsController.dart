

import 'dart:convert';

import 'package:chequewallet/Model/AccountsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';

class ManageAccountsController extends GetxController
{
  var isLoading=false.obs;
  var accounts=<AccountsModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAllAccounts();
  }

  Future _getAllAccounts()async
  {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("bankAccounts").child(FirebaseAuth.instance.currentUser!.uid);
      ref.onValue.listen((event) {
        accounts.clear();
        for(DataSnapshot snapshot in event.snapshot.children)
          {
           Map data=new Map();
           String key=snapshot.key.toString();
           var account=snapshot.value;
           data.addIf(true, "key", key);
           data.addIf(true, "BankAccountsModel", account);
           print(jsonEncode(data));
           var model=accountsModelFromJson(jsonEncode(data));
           accounts.add(model);
          }
      });
      isLoading.value=false;
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}