import 'dart:convert';

import 'package:chequewallet/Model/AccountsModel.dart';
import 'package:chequewallet/Model/AllSignatureModel.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Model/ChequeModel.dart';
import 'package:chequewallet/Model/ManageChequeModel.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/ManageCheque.dart';
import 'package:chequewallet/Views/View_Cheque.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Controllers/EditChequeController.dart';
import '../Widgets/BottomButtons.dart';
import '../Widgets/DropdownButtonBankAccount.dart';
import '../Widgets/check_box.dart';
import '../Widgets/dropdown_digitalised_signature.dart';
import '../Widgets/dropdown_select_payee.dart';
import '../Widgets/textfield_widget.dart';


class EditCheque extends StatefulWidget {

 ManageChequeModel model;
  EditCheque({required this.model});

  @override
  State<EditCheque> createState() => _EditChequeState();
}

class _EditChequeState extends State<EditCheque> {
  bool amount = false;
  bool sign = false;
  bool payee = false;
  bool date = false;
  TextEditingController payeeIdController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateOnChequeController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController amountWordsController = TextEditingController();
  TextEditingController memoController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  var _c=Get.put(EditChequeController());
  AllSignatureModel? signatureModel;
  AllpayeesModel? allpayeesModel;
  AccountsModel? accountsModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController.text=widget.model.chequeModel.amount.toString();
    dateOnChequeController.text=widget.model.chequeModel.date;
    amountWordsController.text=widget.model.chequeModel.amountWords;
    memoController.text=widget.model.chequeModel.memo;
    commentController.text=widget.model.chequeModel.comment;
  }
  @override
  Widget build(BuildContext context) {
    return GetX<EditChequeController>(
        builder: (_) {
          return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('Create Cheque'),
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 30, bottom: 30),
                    child: Text(
                      'New Cheque',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButtonBankAccount(
                          dropdownvalue: accountsModel==null ? _.myAccounts[0] : accountsModel!,items: _.myAccounts, txtLabel: 'Select Bank',onchange: (AccountsModel? model){
                          setState(() {
                            accountsModel=model;
                          });
                        },),
                        DropdownSelectPayee(txtLabel: 'Select Payee', dropdownvalue: allpayeesModel==null ? _.payees[0] : allpayeesModel!,items:_.payees,onchange:  (AllpayeesModel? newValue) {
                          setState(() {
                            allpayeesModel = newValue!;
                          });
                        },),

                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFieldWidget(amountController,'Amount in no.'),
                        TextFieldWidget(dateOnChequeController,'Cheque Date'),
                        DropdownDigitalisedSignature(txtLabel: 'Digital Signature', dropdownvalue:signatureModel==null ? _.signa[0] : signatureModel!,items: _.signa,onchange: (AllSignatureModel? newValue) {
                          setState(() {
                            signatureModel = newValue!;
                          });
                        }, ),
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
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      children: [


                        TextFieldWidget(amountWordsController,'ammount in words'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'PRINT WITHOUT',
                      style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CheckBox(
                            value: amount,
                            ontap: (status) {
                              amount = status;
                              print(status);
                              setState(() {});
                            },
                            title: 'Amount'),
                      ),

                      Expanded(
                        child: CheckBox(
                            value: sign,
                            ontap: (status) {
                              sign = status;
                              print(status);
                              setState(() {});
                            },
                            title: 'Sign'),
                      ),

                      Expanded(
                        child: CheckBox(
                            value: payee,
                            ontap: (status) {
                              payee = status;
                              print(status);
                              setState(() {});
                            },
                            title: 'Payee'),
                      ),

                      Expanded(
                        child: CheckBox(
                            value: date,
                            ontap: (status) {
                              date = status;
                              print(status);
                              setState(() {});
                            },
                            title: 'Date'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child:
                      Row(
                        children: [
                          TextFieldWidget(memoController, "Memo"),
                        ],
                      )
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child:
                      Row(
                        children: [
                          TextFieldWidget(commentController, "Comment"),
                        ],
                      )
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomButtons(
                leftTitle: "Back",
                leftIcon: Icons.keyboard_arrow_left,
                onBack: () {
                  Get.off(()=>ManageCheque());
                },
                rightTitle: "upload",
                rightIcon: Icons.keyboard_arrow_right,
                onNext: ()async {
                  if(accountsModel==null)
                    ShowErrorAlert("Please select bank");
                  else if(payee==null)
                    ShowErrorAlert("please select payee");
                  else if(signatureModel==null)
                    ShowErrorAlert("Please select signature");
                  else if(!DateValidation(dateOnChequeController.text))
                    ShowErrorAlert("please insert a well formatted Date");
                  else if(amountWordsController.text.isEmpty || amountController.text.isEmpty || memoController.text.isEmpty || commentController.text.isEmpty)
                    ShowErrorAlert("please fill all fields properly");
                  else {
                    String chequeno = "";
                    var value = await FirebaseDatabase.instance.ref("chequeno")
                        .child("no")
                        .once();
                    String val = value.snapshot.value.toString();
                    for (int i = 0; i < (6 - val.length); i++) {
                      chequeno += "0";
                    }
                    chequeno += val;
                    int newVal = int.parse(val);
                    newVal++;
                    await FirebaseDatabase.instance.ref("chequeno")
                        .child("no")
                        .set(newVal);
                    var payload;
                    try {
                      payload = {
                        'bank': accountsModel!.bankAccountsModel.bank,
                        'payeeid': allpayeesModel!.key,
                        'payee': payee ? '' : allpayeesModel!.payee.fname + " " +
                            allpayeesModel!.payee.lname,
                        'amountWords': amountWordsController.text,
                        'amount':amount ? 0 : int.parse(amountController.text),
                        'date':date ? '' : dateOnChequeController.text,
                        'signature':sign ? '':  signatureModel!.signModel.sign,
                        'signid': signatureModel!.key,
                        'chequeno': chequeno,
                        "accountno": accountsModel!.bankAccountsModel
                            .accountNumber,
                        "sortCode": accountsModel!.bankAccountsModel.sortCode,
                        'memo': memoController.text,
                        'comment': commentController.text,
                        "email": allpayeesModel!.payee.email
                      };
                    } catch (e) {
                      ShowErrorAlert(e.toString());
                      return;
                    }
                    await _.createCheque(payload,widget.model.key);
                  }
                }),
          );
        }
    );
  }
}