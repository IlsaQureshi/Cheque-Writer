

import 'dart:convert';

import 'package:chequewallet/Controllers/CreatePayeeController.dart';
import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Model/PayeeModel.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/View_Payee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'Dashboard.dart';
import '../Widgets/DropdownButtonBankAccount.dart';
import '../Widgets/BottomButtons.dart';
import '../Widgets/textfield_widget.dart';

class CreatePayee extends StatelessWidget {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController sortCodeController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController address3Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController postCodeController = TextEditingController();
  String dropdownvalue = 'Lloyds Bank';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Create Payee'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 30, bottom: 10),
              child: Text(
                'New Payee',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 20, bottom: 30),
              child: Text(
                'Personal Information',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWidget(firstNameController, 'First Name*'),
                  TextFieldWidget(middleNameController, 'Middle Name'),
                  TextFieldWidget(lastNameController, 'Last Name*'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10, right: 10, top: 5, bottom: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWidget(nickNameController, 'Nick Name'),
                  TextFieldWidget(dobController, 'Date of Birth*'),
                  TextFieldWidget(
                      phoneNumberController, 'Phone Number'),
                ],
              ),
            ),
            Center(
              child: Text(
                'Format: (DD/MM/YYYY)',
                style: TextStyle(fontSize: 8),
              ),
            ),

            Padding(
                padding: EdgeInsets.all(10),
                child:
                Row(
                  children: [
                    TextFieldWidget(emailController,'Email*'),
                  ],
                )

            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWidget(
                      accountNumberController, 'Account Number'),
                  TextFieldWidget(sortCodeController, 'Sort Code'),
                  // DropdownButtonBankAccount(
                  //   dropdownvalue: dropdownvalue, txtLabel: 'Select Bank*',
                  // ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 30, bottom: 10),
              child: Text(
                'Address',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child:
              Row(
                children: [
                  TextFieldWidget(address1Controller, 'Address Line 1*'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child:
              Row(
                children: [
                  TextFieldWidget(address2Controller, 'Address Line 2*'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child:
              Row(
                children: [
                  TextFieldWidget(address3Controller, 'Address Line 3* (optional)'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFieldWidget(cityController, 'City'),
                  TextFieldWidget(countryController, 'Country'),
                  TextFieldWidget(postCodeController, 'Postcode'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtons(
          leftTitle: "Back",
          leftIcon: Icons.keyboard_arrow_left,
          onBack: () {
            Get.off(()=>Dashboard());
          },
          rightTitle: "Create",
          rightIcon: Icons.keyboard_arrow_right,
          onNext: () {
            var payload;
           if(firstNameController.text.isEmpty || middleNameController.text.isEmpty || lastNameController.text.isEmpty ||nickNameController.text.isEmpty ||
           phoneNumberController.text.isEmpty || emailController.text.isEmpty || accountNumberController.text.isEmpty || sortCodeController.text.isEmpty ||
           address1Controller.text.isEmpty || address2Controller.text.isEmpty || cityController.text.isEmpty || countryController.text.isEmpty || postCodeController.text.isEmpty)
             {
               ShowErrorAlert("Please fill all fields properly");

             }
           else if(!DateValidation(dobController.text))
             ShowErrorAlert("Invalid Date Formate");
           else {
             print(dobController.text);
              payload = {
               'fname': firstNameController.text,
               'middlename': middleNameController.text,
               'lname': lastNameController.text,
               'nickname': nickNameController.text,
               'dob': dobController.text,
               'phoneNumber': phoneNumberController.text,
               'email': emailController.text,
               'accountNumber': int.parse(accountNumberController.text),
               'sortCode': Encrypt().encrypt_pass(sortCodeController.text),
               'bank': dropdownvalue,
               'address1': address1Controller.text,
               'address2': address2Controller.text,
               'address3': address3Controller.text,
               'city': cityController.text,
               'country': countryController.text,
               'postCode': postCodeController.text
             };
              Get.to(()=>ViewPayee(payee: Payee.fromJson(jsonDecode(jsonEncode(payload))), isSubmission: true,Key: "",));
           }

            print(dropdownvalue);
          }),
    );
  }

  // Widget TextFieldWidget(String _txt) {
  //   return Padding(
  //     padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
  //     child: Container(
  //         height: 25,
  //         // width: MediaQuery.of(context).size.width * 1,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           border: Border.all(color: Colors.black, width: 1.0),
  //         ),
  //         child: Center(
  //           child: Text(_txt),
  //         )),
  //   );
  // }
}
