import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../Views/BottomButtons.dart';
import 'SignaturePreviewScreen.dart';


class SignatureWidget extends StatefulWidget {


  @override
  _SignatureWidgetState createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    final info = statuses[Permission.storage].toString();
    print(info);
    _toastInfo(info);
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    RenderSignaturePad boundary =
    signatureGlobalKey.currentContext!.findRenderObject() as RenderSignaturePad;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png) );
    if (byteData != null) {
      final time = DateTime.now().millisecond;
      final name = "signature_$time.png";
      final result =
      await ImageGallerySaver.saveImage(byteData.buffer.asUint8List(),quality:100,name:name);
      print(result);
      _toastInfo(result.toString());

      final isSuccess = result['isSuccess'];
      signatureGlobalKey.currentState!.clear();
      if (isSuccess) {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return SignaturePreviewPage(
                signature: File(""),);
            },
          ),
        );
      }
    }
  }

  _toastInfo(String info) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(info),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SIGN here"),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    child: SfSignaturePad(
                        key: signatureGlobalKey,
                        backgroundColor: Colors.white,
                        strokeColor: Colors.black,
                        minimumStrokeWidth: 3.0,
                        maximumStrokeWidth: 6.0),
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)))),
            SizedBox(height: 10),
            Row(children: <Widget>[
              TextButton(
                child: Text('Preview sign',style: TextStyle(fontSize: 20),),
                onPressed: ()async{
                  RenderSignaturePad boundary =
                  signatureGlobalKey.currentContext!.findRenderObject() as RenderSignaturePad;
                  ui.Image image = await boundary.toImage();
                  ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png) );
                  final tempDir = await getTemporaryDirectory();
                  File file = await File('${tempDir.path}/image.png').create();
                  file.writeAsBytes(byteData!.buffer.asUint8List());
                  print(file.path);
                  Get.to(()=>SignaturePreviewPage(
                    signature:file,));
                },
              ),
              TextButton(
                child: Text('Clear',style:TextStyle(fontSize: 20)),
                onPressed: _handleClearButtonPressed,
              )
            ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)
          ],
        ));
  }
}