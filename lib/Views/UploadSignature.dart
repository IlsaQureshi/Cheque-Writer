import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Widgets/BottomButtons.dart';
import 'package:chequewallet/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadSignature extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Signature"),
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          TextWidget("Get your digitalised hand written signature"),
          SizedBox(height: 40,),
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Icon(Icons.upload_rounded,size: 70,),
                Text("Upload Signature",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            )
          )
        ],
      ),
      bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){
        Get.offAll(()=>Dashboard());
      },rightTitle:"Next",rightIcon: Icons.keyboard_arrow_right,onNext: (){}),
    );
  }
}
