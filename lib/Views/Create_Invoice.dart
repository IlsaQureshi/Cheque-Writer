
import 'package:chequewallet/Controllers/ManagePayeeController.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Validation/Validation.dart';
import '../Widgets/BottomButtons.dart';
import '../Widgets/dropdown_select_payee.dart';
import '../Widgets/textfield_widget.dart';
import 'Cheque_Created.dart';
import 'Create_Invoice1.dart';
import 'Email_Sent.dart';

class CreateInvoice extends StatefulWidget {
  const CreateInvoice({Key? key}) : super(key: key);

  @override
  State<CreateInvoice> createState() => _CreateInvoiceState();
}

class _CreateInvoiceState extends State<CreateInvoice> {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  TextEditingController customerMessageController = TextEditingController();
  List<ItemsModel> items=[];
  final txtQty=TextEditingController();
  final txtrate=TextEditingController();
  final txtService=TextEditingController();
  final txtDesc=TextEditingController();
  var _c=Get.put(ManagePayeeController());
  AllpayeesModel? payees;
  double totalCost=0;
  @override
  Widget build(BuildContext context) {
    return GetX<ManagePayeeController>(
      builder: (_controller) {
        if(_controller.payees.length < 1 )
        {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  "Please add atleast 1 payee to create a Invoice",textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),
                ),
              ),
            ),
          );
        }
        return _controller.isLoading.isTrue ? LoadingScreen() : Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('Create Invoice'),
            backgroundColor: Colors.black,
          ),
          body: SingleChildScrollView(
            child: Column(
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
                  padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWidget(invoiceNoController,'Invoice Number'),
                      TextFieldWidget(dateController,'Date'),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: 140, right: 10, top: 2, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Format: (DD/MM/YYYY)',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: _controller.payees.length >0 ? Container(
                    child: DropdownSelectPayee(dropdownvalue: payees==null ?_controller.payees[0] : payees!, txtLabel: "Select Payee", items: _controller.payees, onchange: (AllpayeesModel? model){
                      payees=model;
                      setState(() {

                      });
                    }),
                  ):Container(),
                ),

                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // DropdownSelectPayee(txtLabel: 'Select Payee', dropdownvalue: null,),
                      TextFieldWidget(customerMessageController, 'Customer Message'),
                      TextFieldWidget(phoneNumberController, 'Phone Number'),
                    ],
                  ),
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: 15, right: 10, top: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        payees != null ? payees!.payee.fname : 'Name',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        payees != null ? payees!.payee.address1 :'Address L1',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        payees != null ? payees!.payee.address2 : 'Address L2 opt',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        payees != null ? payees!.payee.address3 :'Address L3 opt',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'City, Country, Post code Country',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 30,
                    decoration: BoxDecoration(color: Colors.blue.withOpacity(.3)),
                    width: MediaQuery.of(context).size.width * 1,
                    child: Padding(
                      padding: EdgeInsets.only(top: 0, right: 10, left: 10),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0 ITEM || SUBTOTAL €${totalCost}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'QTY',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'RATE',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'AMOUNT',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 30,
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      items[index].service,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black, spreadRadius: 1),
                                    ],
                                  ),
                                  height: 30,
                                  width: 160,
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      items[index].desc,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Colors.black, spreadRadius: 1),
                                    ],
                                  ),
                                  height: 30,
                                  width: 160,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${items[index].qty}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "${items[index].rate}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                   "${items[index].rate*items[index].qty}" ,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black, spreadRadius: 1),
                                ],
                              ),
                              height: 60,
                              width: 140,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  child:Column(
                   children: [
                     Row(
                       children: [
                         Expanded(child: Field("Qty", txtQty,true)),
                         Expanded(child: Field("rate", txtrate,true)),

                       ],
                     ),
                     Row(
                       children: [
                         Expanded(child: Field("Service", txtService,false)),
                         Expanded(child: Field("Description", txtDesc,false)),

                       ],
                     ),

                     Container(
                       margin: EdgeInsets.all(20),
                       height: 50,
                       child: InkWell(
                         onTap: (){
                           totalCost=0;
                           items.add(new ItemsModel(txtService.text, txtDesc.text, double.parse(txtQty.text),  double.parse(txtrate.text), 0));

                           for(ItemsModel m in items)
                             {
                               totalCost+=(m.qty * m.rate);
                             }
                           setState(() {

                           });
                         },
                         child: Container(
                           decoration: BoxDecoration(
                               color: Colors.black,
                               borderRadius: BorderRadius.circular(20)
                           ),
                           child: Center(
                             child: Text("Add item",style: TextStyle(color: Colors.white),),
                           ),
                         ),
                       ),
                     )
                   ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: (){
            Get.off(()=>Dashboard());
          },rightTitle:"Next",rightIcon: Icons.keyboard_arrow_right,onNext: (){
            if(items.length<0)
              ShowErrorAlert("please add some items");
           else if(!DateValidation(dateController.text))
             print("invalid");
           else if(  invoiceNoController.text.isEmpty || dateController.text.isEmpty || customerMessageController.text.isEmpty || phoneNumberController.text.isEmpty)
             ShowErrorAlert("please fill all fields properly");
           else
            Get.to(()=>CreateInvoice1(items, totalCost, invoiceNoController.text, dateController.text, payees!, customerMessageController.text, phoneNumberController.text));
          }),
        );
      }
    );
  }
  Widget Field(String hint,var controller,bool isnum)
  {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        controller: controller,
        keyboardType: isnum ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black
            )
          )
        ),
      ),
    );
  }
}


class ItemsModel
{
  String service;
  String desc;
  double qty;
  double rate;
  double ammount;

  ItemsModel(this.service, this.desc, this.qty, this.rate, this.ammount);
}