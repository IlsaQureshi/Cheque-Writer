
import 'dart:convert';

import 'package:chequewallet/Model/ManageChequeModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';

class DashboardController extends GetxController
{
  var isLoading=false.obs;
  var invoices=<String>[].obs;
  var total=<double>[0,0,0,0,0,0,0,0,0,0,0,0].obs;
  var cheques=<ManageChequeModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllData();
  }
  Future getAllData()async
  {
    try{
      isLoading.value=true;

      final ref=await FirebaseDatabase.instance.ref("cheques");
      var data=await ref.child(FirebaseAuth.instance.currentUser!.uid).once();
      for(DataSnapshot snapshot in data.snapshot.children)
        {
          var map=snapshot.value as Map;
          Map data=new Map();
          String key=snapshot.key.toString();
          var chq=snapshot.value;
          data.addIf(true, "key", key);
          data.addIf(true,"ChequeModel",chq);
          cheques.add(manageChequeModelFromJson(jsonEncode(data)));
          int month=int.parse(map['date'].toString().split('/')[1]);
          for(int i=0;i<12;i++)
            {

              if(i+1==month)
                {
                  int am=int.parse(map['amount'].toString());
                  total[i]=(total[i]+am)/4000;
                }
            }

        }
      await getAllInvoice();
      isLoading.value=false;
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
  Future getAllInvoice()async
  {
    try{
      final ref=FirebaseDatabase.instance.ref("invoice").child(FirebaseAuth.instance.currentUser!.uid);
      ref.onValue.listen((event) {
        invoices.clear();
        for(DataSnapshot snp in event.snapshot.children)
        {
          var map=snp.value as Map;
          invoices.add(map['invoice']);
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