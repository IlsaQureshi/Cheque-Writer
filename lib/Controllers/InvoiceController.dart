

import 'dart:convert';
import 'dart:io';

import 'package:chequewallet/Model/InvoiceModel.dart';
import 'package:chequewallet/Views/ManageInvoices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';
import '../Views/DigitalizeSignature.dart';

class InvoiceController extends GetxController
{
  var isLoading=false.obs;
  var invoices=<InvoiceMmodel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllInvoice();
  }
  Future getAllInvoice()async
  {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("invoice").child(FirebaseAuth.instance.currentUser!.uid);
      ref.onValue.listen((event) {
        invoices.clear();
        for(DataSnapshot snp in event.snapshot.children)
          {
            var map=Map();
            String key=snp.key.toString();
            map.addIf(true, "key", key);
            map.addIf(true, "image", snp.value);
            invoices.add(invoiceMmodelFromJson(jsonEncode(map)));
            print(jsonEncode(map));
          }
      });
      isLoading.value=false;
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }

  }
  Future uplaodSignature(File file)async
  {
    try{
      isLoading.value=true;
      DateTime dt=DateTime.now();
      final storageRef=FirebaseStorage.instance.ref("files/"+dt.toString()+file.path.split('/').last);
      TaskSnapshot task=await storageRef.putFile(file);
      String downloadUrl=await task.ref.getDownloadURL();
      if(downloadUrl.isNotEmpty)
      {
        final ref=FirebaseDatabase.instance.ref("invoice");
        var payLoad={
          'invoice':downloadUrl,
        };
        await ref.child(FirebaseAuth.instance.currentUser!.uid).push().set(payLoad);
      }
      isLoading.value=false;
      Get.off(()=>ManageInvoices());
    }catch(e)
    {
      isLoading.value=false;
      print(e.toString());
      ShowErrorAlert(e.toString());
    }
  }
}