import 'package:chequewallet/Validation/Validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPass extends StatelessWidget {
  final txtEmail=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget password"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: ()async{
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: txtEmail.text);
                  Get.snackbar("Success", "password reset email sent",backgroundColor: Colors.green);

                }catch(e)
                {
                  ShowErrorAlert(e.toString());
                }
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
                ),
                child:Center(
                  child: Text("Recover password",style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
