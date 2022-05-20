
import 'dart:io';

import 'package:chequewallet/Controllers/InvoiceController.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Model/InvoiceModel.dart';
import 'package:chequewallet/Views/Create_Invoice.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:dotted_line/dotted_line.dart';
import 'Dashboard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../Widgets/BottomButtons.dart';
import '../Widgets/dropdown_select_payee.dart';
import '../Widgets/textfield_widget.dart';
import 'Cheque_Created.dart';
import 'Email_Sent.dart';

class CreateInvoice1 extends StatelessWidget {


  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController customerMessageController = TextEditingController();
  List<ItemsModel> items;
  double totalCost;
  String invoiceNum;
  String date;
  AllpayeesModel payees;
  String msg;
  String phno;
  CreateInvoice1(this.items,this.totalCost, this.invoiceNum,this.date,this.payees,this.msg,this.phno);
  var _c=Get.put(InvoiceController());
  @override
  Widget build(BuildContext context) {
    return GetX<InvoiceController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Invoice products'),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: invc(),

          ),
          bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){
            Get.off(()=>Dashboard());
          },rightTitle:"Next",rightIcon: Icons.keyboard_arrow_right,onNext: ()async{
            final controller=ScreenshotController();
            final bytes=await controller.captureFromWidget(Material(child: invc(),));
            DateTime dt=DateTime.now();
            final tempdir=await getTemporaryDirectory();
            File file=new File(tempdir.path+"/image${dt.toString()}.png");
            file.writeAsBytes(bytes);
            await _.uplaodSignature(file);
            print(file.path);
          }),
        );
      }
    );
  }
  Widget invc()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 30, bottom: 30),
          child: Text(
            'Create Invoice',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 20, bottom: 0),
          child: Text(
            payees.payee.phoneNumber,
            style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
          child: Text(
            payees.payee.email,
            style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 10, top: 20, bottom: 0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invoice'.toUpperCase(),
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Invoice'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    invoiceNum.toUpperCase(),
                    style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Date'.toUpperCase(),
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 45,
              ),
              Text(
                date.toUpperCase(),
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: 15, right: 10, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Invoice to'.toUpperCase(),
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                payees.payee.fname+" "+payees.payee.middlename+" "+payees.payee.lname,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                payees.payee.address1,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                payees.payee.address2,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                payees.payee.address3,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${ payees.payee.city}, ${ payees.payee.country}, ${ payees.payee.postCode}',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        Center(

          child: DataTable(
            columnSpacing: 20,
            headingRowColor: MaterialStateProperty.all(Colors.cyan.withOpacity(0.2)),
            columns: [
              DataColumn(label: Text("Service")),
              DataColumn(label: Text("Description")),
              DataColumn(label: Text("QTY")),
              DataColumn(label: Text("RATE")),
              DataColumn(label: Text("AMOUNT")),

            ],
            rows: items.map((ItemsModel model){
              return DataRow(
                  cells:[
                    DataCell(
                      Text(model.service),
                    ),
                    DataCell(
                      Text(model.desc),
                    ),
                    DataCell(
                      Text("${model.qty}"),
                    ),
                    DataCell(
                      Text("${model.rate}"),
                    ),
                    DataCell(
                      Text("${model.rate*model.qty}"),
                    ),
                  ]
              );
            }).toList(),
          ),
        )
        ,

        Padding(
          padding: EdgeInsets.all(10),
          child: DottedLine(),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'SUBTOTAL',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w700),
              ),
              Text(
                '£${totalCost}',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
