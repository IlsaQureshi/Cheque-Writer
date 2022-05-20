import 'dart:io';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:http/http.dart'as http;
import 'package:chequewallet/SendEmail/SendEmail.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../Widgets/BottomButtons.dart';

class InvoiceImage extends StatefulWidget {
  String img;
   InvoiceImage(this.img);

  @override
  State<InvoiceImage> createState() => _InvoiceImageState();
}

class _InvoiceImageState extends State<InvoiceImage> {
   bool Loading=false;

   final txtEmail=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Loading ? LoadingScreen() : Scaffold(
      appBar: AppBar(
        title: Text("mail Invoice"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Image.network(
              widget.img,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                hintText: "Email to ?",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          )
        ],
      ),
       bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){
         Get.back();
    },rightTitle:"Send Email",rightIcon: Icons.keyboard_arrow_right,onNext: ()async{
      if(txtEmail.text.isEmpty)
        ShowErrorAlert("Please enter email address");
      else{
       try{
         Loading=true;
         setState(() {

         });
         var res=await http.Client().get(Uri.parse(widget.img));
         DateTime st=DateTime.now();
         final tempdir=await getTemporaryDirectory();
         File f=new File(tempdir.path+"/img${st.toString()}.png");
         await f.writeAsBytes(res.bodyBytes);
         await EmailSender().Send(f,txtEmail.text);
         Loading=false;
         setState(() {

         });
       }catch(e)
         {
           Loading=false;
           ShowErrorAlert(e.toString());
           setState(() {

           });
         }

      }
    }),
    );
  }
}
