import 'package:chequewallet/Controllers/CreatePayeeController.dart';
import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/BottomButtons.dart';



class ViewPayee extends StatelessWidget {
 Payee payee;
 bool isSubmission;
 String Key;
  ViewPayee({required this.payee,required this.isSubmission,required this.Key});
  var _c=Get.put(CreatePayeeController());
  @override
  Widget build(BuildContext context) {
    return GetX<CreatePayeeController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('View Payee'),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 30, bottom: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Payee',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        // Image.asset(
                        //   'assets/icon_print.png',
                        //   height: 25,
                        //   width: 25,
                        // ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20, bottom: 30),
                  child: Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 50, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'First Name*',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Middle Name',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Last Name*',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 70, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(payee.fname),
                      Text(payee.middlename),
                      Text(payee.lname),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 30, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nick Name',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Date of Birth*',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 25, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(payee.nickname),
                      Text(payee.dob),
                      Text(payee.phoneNumber),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 0),
                  child: Text(
                    'Email*',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(payee.email),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 50,
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Account Number',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Sort Code',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Select Bank',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 40, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(payee.accountNumber.toString()),
                      Text("${Encrypt().DecryptPass(payee.sortCode)}"),
                      Text(payee.bank),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 0),
                  child: Text(
                    'Address Line 1',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 0),
                  child: Text(
                    payee.address1,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 0),
                  child: Text(
                    'Address Line 2',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 0),
                  child: Text(
                    payee.address2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 0),
                  child: Text(
                    'Address Line 3',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 0),
                  child: Text(
                    payee.address3,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 50, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'City',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Country',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Postcode',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 80, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(payee.city),
                      Text(payee.country),
                      Text(payee.postCode),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Center(
                //   child: Text(
                //     'Date Created: 02/03/2022',
                //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                //   ),
                // ),

              ],
            ),
          ),
          bottomNavigationBar:!isSubmission ? Container(height: 0,width: 0,) : BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){

          },rightTitle:"Done",rightIcon: Icons.keyboard_arrow_right,onNext: ()async{
            print(payee.dob);
            await _.createPayee(
                fname: payee.fname,
                middlename: payee.middlename,
                lname: payee.lname,
                nickname: payee.nickname,
                Dob: payee.dob,
                phoneNumber: payee.phoneNumber,
                email: payee.email,
                accountNumber: payee.accountNumber,
                sortCode: payee.sortCode,
                BankName:payee.bank ,
                address1: payee.address1,
                address2: payee.address2,
                address3: payee.address3,
                city: payee.city,
                country: payee.country,
                postCode: payee.postCode
            );

          }),
        );
      }
    );
  }

  Widget TextFieldWidget(String _txt) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Container(
          height: 25,
          // width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 1.0),
          ),
          child: Center(
            child: Text(_txt),
          )),
    );
  }
}
