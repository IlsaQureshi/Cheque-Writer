


import 'dart:convert';
import 'dart:io';

import 'package:chequewallet/Model/AllSignatureModel.dart';
import 'package:chequewallet/Views/DigitalizeSignature.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';

class SignatureController extends GetxController
{
  FirebaseStorage storage = FirebaseStorage.instance;
  var isLoading=false.obs;
  var signs=<AllSignatureModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _getAllSign();
  }
  Future _getAllSign()async
  {
    try{
      final ref=FirebaseDatabase.instance.ref("signature");
      ref.child(FirebaseAuth.instance.currentUser!.uid).onValue.listen((event) {
        signs.clear();
       if(event.snapshot!=null)
         {
           for(DataSnapshot snapshot in event.snapshot.children)
           {
             Map map=new Map();
             String key=snapshot.key.toString();
             var sign=snapshot.value;
             map.addIf(true, "key", key);
             map.addIf(true, "SignModel", sign);
             signs.add(allSignatureModelFromJson(jsonEncode(map)));
             print(jsonEncode(map));
           }
         }
      });
    }catch(e)
    {

    }
  }

  Future uplaodSignature(String name,File sign)async
  {
    try{
      isLoading.value=true;
      DateTime dt=DateTime.now();
      final storageRef=storage.ref("files/"+dt.toString()+sign.path.split('/').last);
      TaskSnapshot task=await storageRef.putFile(sign);
      String downloadUrl=await task.ref.getDownloadURL();
      if(downloadUrl.isNotEmpty)
        {
          final ref=FirebaseDatabase.instance.ref("signature");
          var payLoad={
            'name':name,
            'sign':downloadUrl,
          };
          await ref.child(FirebaseAuth.instance.currentUser!.uid).push().set(payLoad);
        }
      isLoading.value=false;
      Get.off(()=>DigitalizeSignature());
    }catch(e)
    {
      isLoading.value=false;
      print(e.toString());
      ShowErrorAlert(e.toString());
    }
  }

}