import '../Widgets/bottom_buttons.dart';
import 'Create_Cheque.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Email_Sent.dart';


class ChequeCreated extends StatelessWidget {
  const ChequeCreated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Cheque Created'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 30, top: 30),
                child: Image.asset(
                  'assets/icon_print.png',
                  height: 25,
                  width: 25,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1.5),
                      // borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Payee 3',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '28-12-2021',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Two hundred only',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                '€200',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                ),
                                child: Text(
                                  '123456',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                ),
                                child: Text(
                                  '14-56-78',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 1.0),
                                ),
                                child: Text(
                                  '12345678',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email to:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payee Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Payee1@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              BottomButtons(
                  Icons.arrow_back_ios,
                  'Back',
                  () {
                    Get.to(() => EmailSent());
                  },
                  'Email',
                  Icons.arrow_forward_ios,
                  () {
                    Get.to(() => CreateCheque());
                  },
                  60),
            ],
          ),
        ));
  }
}
