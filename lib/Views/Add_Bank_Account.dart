
import 'dart:ui';
import 'package:chequewallet/Encryption/Encrypt.dart';

import 'Dashboard.dart';
import 'package:chequewallet/Controllers/AddBankAccountController.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/BottomButtons.dart';
import 'ForgetMemorableInformation.dart';

class Add_Bank_Account extends StatelessWidget {
  var _c=Get.put(AddBankAccountController());

   ForgetMemorableInformation obj1 = ForgetMemorableInformation();
   final first_name=TextEditingController();
   final middle_name=TextEditingController();
   final last_name=TextEditingController();
   final date_of_birth=TextEditingController();
   final account_number=TextEditingController();
   final sort_code=TextEditingController();
   final bank=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<AddBankAccountController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar:

          AppBar(title: Text("Add Bank Account",style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.black,
            centerTitle: true,
          ),

          body:

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("New Bank Account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                SizedBox(height: 30,),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Please enter the following details as per your bank accountdetails",style: TextStyle(fontWeight: FontWeight.bold),)),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(child: obj1.TextField1("First Name", "", 10, 10, first_name),),
                    Expanded(child: obj1.TextField1("Middle Name", "", 0, 10, middle_name),),
                    Expanded(child: obj1.TextField1("Last Name", "", 0, 10, last_name),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: obj1.TextField1("Date of Birth", "", 10, 10, date_of_birth),),
                    Expanded(child: obj1.TextField1("Account Number", "", 0, 10, account_number),),
                    Expanded(child: obj1.TextField1("Sort Code", "", 0, 10, sort_code),),
                  ],
                ),
                SizedBox(height: 20),
                obj1.TextField1("Bank", "", 10, 10, bank),
              ],
            ),
          ),

          bottomNavigationBar: BottomButtons(onBack: (){
            Get.off(()=>Dashboard());
          }, onNext:(){
            if(bank.text.isEmpty || first_name.text.isEmpty || last_name.text.isEmpty || account_number.text.isEmpty || sort_code.text.isEmpty)
              ShowErrorAlert("Please fill all fields properly");
            else if(!DateValidation(date_of_birth.text))
              ShowErrorAlert("date format must be DD/MM/YYYY");
            else {
              _.addBankAccount(
                  bank: bank.text,
                  fname: first_name.text,
                  middlename: middle_name.text,
                  lname: last_name.text,
                  Dob: date_of_birth.text,
                  accountNumber: account_number.text,
                  sortCode: Encrypt().encrypt_pass(sort_code.text)
              );
            }
          }, rightIcon: Icons.keyboard_arrow_right, leftIcon: Icons.keyboard_arrow_left, leftTitle: 'Back', rightTitle: 'Create',),
        );
      }
    );
  }
}
