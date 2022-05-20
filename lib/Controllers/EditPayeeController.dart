

import 'package:chequewallet/Views/ManagePayee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';

class EditPayeeController extends GetxController
{
  var isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  Future<void> createPayee({required var payload,required String key})
  async {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("Payee");
      String id=FirebaseAuth.instance.currentUser!.uid;

      await ref.child(key).set(payload);
      isLoading.value=false;
      Get.off(()=>ManagePayee());
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}