
// ignore_for_file: prefer_const_constructors

import 'dart:ui';


import 'package:chequewallet/Controllers/SignupController.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/BottomButtons.dart';
import 'ForgetMemorableInformation.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  ForgetMemorableInformation obj1 = ForgetMemorableInformation();
  var _c=Get.put(SignupController());

   final firstname=TextEditingController();
   final lastname=TextEditingController();
   final username=TextEditingController();
   final email=TextEditingController();
   final password=TextEditingController();
   final date_of_birth=TextEditingController();
   final re_enter_password=TextEditingController();
   final transaction_password=TextEditingController();
   final re_enter_transaction_password=TextEditingController();

   bool check=false;

  @override
  Widget build(BuildContext context) {
    return GetX<SignupController>(
      builder: (_) {

        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar:AppBar(title: Text("Sign Up",
            style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.black,
          ),

          body:
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: obj1.TextField1("FIRST NAME", "Enter First Name", 5, 5, firstname)),

                    Expanded(child: obj1.TextField1("LAST NAME", "Enter Last Name", 5, 5, lastname)),
                  ],
                ),
                SizedBox(height: 20),
                   obj1.TextField1("USERNAME", "Enter Username", 5, 5, username),

                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: obj1.TextField1("DATE OF BIRTH", "", 5, 5, date_of_birth)),
                    Expanded( child: Text("\n\nFormat:(DD/MM/YYYY)"),)
                  ],
                ),
                SizedBox(height: 20),
                obj1.TextField1("EMAIL", "Email", 5, 5, email),
                SizedBox(height: 20),
                obj1.TextField1("PASSWORD", "********", 5, 5, password),
                SizedBox(height: 20),
                obj1.TextField1("RE-ENTER PASSWORD", "********", 5, 5, re_enter_password),
                SizedBox(height: 20,),

                Container(
                  alignment: Alignment.centerLeft,
                    child: Text("The Password should contain")
                ),

                SizedBox(height: 20,),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(child: Text("  1. Atleast 8 Characters")),
                    Expanded( child: Text("  2. At least 1 Number"),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(child: Text("  3. Atleast 1 Letter")),
                    Expanded( child: Text("  4. At least 1 Symbol"),)
                  ],
                ),
                SizedBox(height: 20,),
                obj1.TextField1("TRANSACTION PASSWORD", "********", 5, 5, transaction_password),
                SizedBox(height: 20),
                obj1.TextField1("RE-ENTER TRANSACTION PASSWORD", "********", 5, 5, re_enter_transaction_password),
                SizedBox(height: 20),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(value: check, onChanged: (bool? value) {

                   check=value!;
                   setState(() {
                   });

                      },),
                    Expanded(child: Text("\nYou have read an acknowledged our Terms & Condition and Privacy Statement are willing to agree to it.",textAlign: TextAlign.center,)),
                  ],
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomButtons(onBack: (){
            Get.off(()=>Login());
          }, onNext:()async{
            if(firstname.text.isEmpty || lastname.text.isEmpty || username.text.isEmpty || email.text.isEmpty || password.text.isEmpty || transaction_password.text.isEmpty)
              {
                ShowErrorAlert("please fill all fields");
              }
            else if(transaction_password.text!=re_enter_transaction_password.text)
              ShowErrorAlert("transaction password does not match");
            else if(password.text != re_enter_password.text)
              ShowErrorAlert("password does not matched");
            else if(!DateValidation(date_of_birth.text))
              print("");
            else
            await _.doSignup(firstname.text, lastname.text, password.text, date_of_birth.text, email.text, transaction_password.text);
          }, rightIcon: Icons.arrow_forward_ios, leftIcon: Icons.arrow_back_ios, leftTitle: 'Back', rightTitle: 'Next',),
        );
      }
    );

  }
}
