import 'package:chequewallet/Views/ManagePayee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Widgets/BottomButtons.dart';
import 'Email_Sent.dart';

import 'Create_Cheque.dart';

class PayeeCreated extends StatelessWidget {
  const PayeeCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Payee Created'),
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
                      'New Payee Created',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Image.asset(
                      'assets/icon_print.png',
                      height: 25,
                      width: 25,
                    ),
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
                  Text('abc'),
                  Text('def'),
                  Text('xyz'),
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
                  Text('xzyt'),
                  Text('02/05/1999'),
                  Text('072312445'),
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
              child: Text('abc@gmail.com'),
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
                  Text('12345678'),
                  Text('00-11-22'),
                  Text('Lloyds Bank'),
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
                '-',
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
                '-',
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
                '-',
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
                  Text('-'),
                  Text('-'),
                  Text('-'),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){
        Get.off(()=>ManagePayee());
      },rightTitle:"Done",rightIcon: Icons.keyboard_arrow_right,onNext: (){}),
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
