

import 'dart:convert';

import 'package:chequewallet/Controllers/EditPayeeController.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Model/PayeeModel.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/View_Payee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ManagePayee.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/DropdownButtonBankAccount.dart';
import '../Widgets/BottomButtons.dart';
import '../Widgets/textfield_widget.dart';

class EditPayee extends StatefulWidget {

  AllpayeesModel model;
  EditPayee({required this.model});

  @override
  State<EditPayee> createState() => _EditPayeeState();
}

class _EditPayeeState extends State<EditPayee> {
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
  var _c=Get.put(EditPayeeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstNameController.text=widget.model.payee.fname;
    middleNameController.text=widget.model.payee.middlename;
    lastNameController.text=widget.model.payee.lname;
    nickNameController.text=widget.model.payee.nickname;
    dobController.text=widget.model.payee.dob;
    emailController.text=widget.model.payee.email;
    address1Controller.text=widget.model.payee.address1;
    address2Controller.text=widget.model.payee.address2;
    address3Controller.text=widget.model.payee.address3;
    cityController.text=widget.model.payee.city;
    countryController.text=countryController.text;
    postCodeController.text=widget.model.payee.postCode;
  }
  @override
  Widget build(BuildContext context) {
    return GetX<EditPayeeController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
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
                Get.off(()=>ManagePayee());
              },
              rightTitle: "Update",
              rightIcon: Icons.keyboard_arrow_right,
              onNext: ()async {
                var payload;
                if(firstNameController.text.isEmpty || middleNameController.text.isEmpty || lastNameController.text.isEmpty ||nickNameController.text.isEmpty ||
                    phoneNumberController.text.isEmpty || emailController.text.isEmpty || accountNumberController.text.isEmpty || sortCodeController.text.isEmpty ||
                    address1Controller.text.isEmpty || address2Controller.text.isEmpty || cityController.text.isEmpty || countryController.text.isEmpty || postCodeController.text.isEmpty)
                {
                  ShowErrorAlert("Please fill all fields");

                }
                else if(!DateValidation(dobController.text))
                  ShowErrorAlert("Invalid Date Formate");
                else {
                  payload = {
                    'fname': firstNameController.text,
                    'middlename': middleNameController.text,
                    'lname': lastNameController.text,
                    'nickname': nickNameController.text,
                    'Dob': dobController.text,
                    'phoneNumber': phoneNumberController.text,
                    'email': emailController.text,
                    'accountNumber': int.parse(accountNumberController.text),
                    'sortCode': sortCodeController.text,
                    'BankName': dropdownvalue,
                    'address1': address1Controller.text,
                    'address2': address2Controller.text,
                    'address3': address3Controller.text,
                    'city': cityController.text,
                    'country': countryController.text,
                    'postCode': postCodeController.text
                  };
                  _.createPayee(payload: payload, key: widget.model.key);
                }

                print(dropdownvalue);
              }),
        );
      }
    );
  }
}
