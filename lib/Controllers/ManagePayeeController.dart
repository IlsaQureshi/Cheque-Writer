
import 'dart:convert';

import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Model/PayeeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';

class ManagePayeeController extends GetxController
{
  var payees=<AllpayeesModel>[].obs;
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadAllPayees();
  }
  Future loadAllPayees()async
  {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("Payee");
      ref.onValue.listen((event) {
        payees.clear();
        for(DataSnapshot snap in event.snapshot.children)
          {
            Map map=new Map();
            String key=snap.key.toString();
            Map payee=snap.value as Map;
            map.addIf(true, "key", key);
            map.addIf(true,"payee",payee);
            var model=allpayeesModelFromJson(jsonEncode(map));
            if(model.payee.ownerid==FirebaseAuth.instance.currentUser!.uid)
              {
                payees.add(model);
              }

          }
        isLoading.value=false;
      });

    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}