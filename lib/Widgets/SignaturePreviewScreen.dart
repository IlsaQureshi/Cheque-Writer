import 'dart:io';
import 'dart:typed_data';
import 'package:chequewallet/Controllers/SignatureController.dart';
import 'package:chequewallet/Views/BottomButtons.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class SignaturePreviewPage extends StatelessWidget {
  final File signature;
  var _c=Get.put(SignatureController());

   SignaturePreviewPage({
    required this.signature,
  });
   final txtName=TextEditingController();

  @override
  Widget build(BuildContext context) =>  GetX<SignatureController>(
    builder: (_) {
      return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: CloseButton(),
          title: Text('Store Signature'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              width: double.infinity,
                child: Image.file(signature)
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: txtName,
                decoration: InputDecoration(
                  hintText: "Enter name for signature",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomButtons(
          leftTitle: "Back",
          onBack: (){

          },
          leftIcon: Icons.keyboard_arrow_left,
          rightTitle: "upload",
          rightIcon: Icons.keyboard_arrow_right,
          onNext: (){
            storeSignature(context,txtName.text,_);
          },
        ),
      );
    }
  );

  Future storeSignature(BuildContext context,String name,var controller) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    await controller.uplaodSignature(name, signature );
  }
}