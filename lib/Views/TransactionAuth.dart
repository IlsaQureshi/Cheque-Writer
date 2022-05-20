import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Preferences/Prefs.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/Settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionAuth extends StatelessWidget {

  final txt=TextEditingController();
  Widget _to;
  TransactionAuth(this._to);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter transaction password",),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            child: Text("Please Verify your transaction password",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
          ),
          SizedBox(height: 30,),
          MyField("transaction password", txt)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()async{
          String tpass=await Prefs.getTpass();
          print(tpass);
          if(txt.text==Encrypt().DecryptPass(tpass)){
            Get.off(()=>_to);
          }
          else
            ShowErrorAlert("wrong transaction password");
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
  Widget MyField(String hint,var controller)
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black,
                )
            )
        ),
      ),
    );
  }
}
