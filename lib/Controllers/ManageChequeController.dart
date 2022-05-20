
import 'dart:convert';

import 'package:chequewallet/Model/ManageChequeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';

class ManageChequeController extends GetxController
{
  var isLoading=false.obs;
  var cheques=<ManageChequeModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllCheques();
  }

  Future getAllCheques()async
  {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("cheques").child(FirebaseAuth.instance.currentUser!.uid);
      cheques.clear();
      ref.onValue.listen((event) {
        cheques.clear();
        for(DataSnapshot snapshot in event.snapshot.children)
          {
            Map map=new Map();
            String key=snapshot.key.toString();
            map.addIf(true, "key", key);
            map.addIf(true, "ChequeModel", snapshot.value);
            cheques.add(manageChequeModelFromJson(jsonEncode(map)));
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