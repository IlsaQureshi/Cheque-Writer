import 'dart:io';

import 'package:chequewallet/SendEmail/SendEmail.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Widgets/BottomButtons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:document_scanner_flutter/configs/configs.dart';

class UploadImage extends StatefulWidget {
  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? file;
  File? _scannedDocumentFile;
  File? _scannedImage;
  openImageScanner(BuildContext context) async {
    var image = await DocumentScannerFlutter.launch(context,
        //source: ScannerFileSource.CAMERA,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "Next Step",
          ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
        });
    if (image != null) {
      _scannedImage = image;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black,width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: _scannedImage==null ? Center(child: Text("No image"),) : Image.file(_scannedImage!,fit: BoxFit.fill,),
            ),

            SizedBox(
              width: 200,
              height: 40,
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Colors.black,

                onPressed: (){
                  openImageScanner(context);
                },
                child: Text("Pick Image",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomButtons(leftIcon: Icons.keyboard_arrow_left,leftTitle: "Back", onBack: (){
        Get.offAll(()=>Dashboard());
      }, rightTitle: "Next",rightIcon: Icons.keyboard_arrow_right,onNext: ()async{
        await EmailSender().Send(_scannedImage!, "");
      },),
    );
  }
}
