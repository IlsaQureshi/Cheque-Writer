
import 'package:chequewallet/Views/ManageInvoices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Model/AllpayeesModel.dart';
import '../Widgets/BottomButtons.dart';
import 'Cheque_Created.dart';
import 'Create_Invoice.dart';
import 'Email_Sent.dart';


class ViewInvoice extends StatelessWidget {
  List<ItemsModel> items;
  double totalCost;
  String invoiceNum;
  String date;
  AllpayeesModel payees;
  String msg;
  String phno;
  ViewInvoice(this.items,this.totalCost, this.invoiceNum,this.date,this.payees,this.msg,this.phno,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('View Invoice'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 30, top: 30),
            // child: Image.asset(
            //   'assets/icon_print.png',
            //   height: 25,
            //   width: 25,
            // ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
            child: Container(
              height: 800,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 30, bottom: 0),
                    child: Text(
                      'Company Name',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 20, bottom: 0),
                    child: Text(
                      'Phone Number',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
                    child: Text(
                      'Email',
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
                              '1000'.toUpperCase(),
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
                          '22/03/2022'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
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
                          'Due Date'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '22/04/2022'.toUpperCase(),
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
                          'Name',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Address L1',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Address L2 opt',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Address L3 opt',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'City, Country, Post code Country',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
                    child: Container(
                        height: 30,
                        decoration:
                            BoxDecoration(color: Colors.blue.withOpacity(.3)),
                        width: MediaQuery.of(context).size.width * 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: 0, right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SERVICE',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'DESCRIPTION',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'QTY',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'RATE',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'AMOUNT',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        )),
                  ),
                  RowData('Sales', 'Rice', '10', '3', '30'),
                  RowData('Sales', 'Sprite', '10', '3', '30'),
                  RowData('Sales', 'Lamp', '10', '3', '30'),
                  RowData('Sales', 'Organiser', '10', '3', '30'),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Divider(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Subtotal'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Text(
                          '€120'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Tax'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 98,
                        ),
                        Text(
                          '1\t%'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 0, bottom: 0, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Balance due'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '€132'.toUpperCase(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 10),
                    child: Text(
                      'Notes',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      )),
      bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){
        Get.off(()=>ManageInvoices());
      },rightTitle:"Create",rightIcon: Icons.keyboard_arrow_right,onNext: (){
        Get.off(()=>ManageInvoices());
      }),
    );
  }

  Widget RowData(
    String txt1,
    String txt2,
    String txt3,
    String txt4,
    String txt5,
  ) {
    return Container(
        height: 30,
        //width: MediaQuery.of(context).size.width * 1,
        child: Padding(
          padding: EdgeInsets.only(top: 0, right: 30, left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt1,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                txt2,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 0,
              ),
              Text(
                txt3,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                txt4,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                txt5,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ));
  }
}

class TableData extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<TableData> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: ListView(children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                    label: Text('ID',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Profession',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Actor')),
                ]),
                DataRow(cells: [
                  DataCell(Text('5')),
                  DataCell(Text('John')),
                  DataCell(Text('Student')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10')),
                  DataCell(Text('Harry')),
                  DataCell(Text('Leader')),
                ]),
                DataRow(cells: [
                  DataCell(Text('15')),
                  DataCell(Text('Peter')),
                  DataCell(Text('Scientist')),
                ]),
              ],
            ),
          ])),
    );
  }
}
