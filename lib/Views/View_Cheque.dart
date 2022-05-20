// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:typed_data';

import 'package:chequewallet/Controllers/CreateChequeController.dart';
import 'package:chequewallet/Encryption/Encrypt.dart';
import 'package:chequewallet/ImageGeneration/WidgetToImage.dart';
import 'package:chequewallet/Model/ManageChequeModel.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/ManageCheque.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../ImageGeneration/utils.dart';
import '../SendEmail/SendEmail.dart';
import '../Widgets/BottomButtons.dart';
import 'Create_Cheque.dart';
import 'Email_Sent.dart';


class ViewCheque extends StatefulWidget {
  ChequeModel _chequeModel;
  ViewCheque(this._chequeModel);

  @override
  State<ViewCheque> createState() => _ViewChequeState();
}

class _ViewChequeState extends State<ViewCheque> {
  GlobalKey? key1;

  Uint8List? bytes1;
  var _c=Get.put(CreateChequeController());
  @override
  Widget build(BuildContext context) {
    return GetX<CreateChequeController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: Text('View Cheque'),
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
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: cheque(),
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
                        widget._chequeModel.payee,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 10,
                      bottom: 90,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget._chequeModel.email,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Date Created: 02/03/2022',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ),

                ],
              ),
            ),
          bottomNavigationBar:BottomButtons(leftTitle: "Back",leftIcon: Icons.keyboard_arrow_left,onBack: ()async{

          },rightTitle:"Email",rightIcon: Icons.keyboard_arrow_right,onNext: () async {
            _.isLoading.value=true;
            final tempDir = await getTemporaryDirectory();
            DateTime dt = DateTime.now();
            File file = await File(
                '${tempDir.path}/image${dt.toString()}.png').create();
            int chequeno=0;
            try {


              final controller = ScreenshotController();
              bytes1 =
              await controller.captureFromWidget(Material(child: cheque()));



              file.writeAsBytes(bytes1!.buffer.asUint8List());
              await EmailSender().Send(file,widget._chequeModel.email);
            }catch(e)
            {
              Get.snackbar("Error", e.toString());
            }

          }),

        );
      }
    );
  }

  Widget cheque()
  {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 1.5),
          // borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Center(child: Text(widget._chequeModel.bank),),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget._chequeModel.payee,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    widget._chequeModel.date,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget._chequeModel.amountWords,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "£${widget._chequeModel.amount}",
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget._chequeModel.signature,),
                            fit: BoxFit.fill
                        )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        widget._chequeModel.chequeno,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'MICRE13B',
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        Encrypt().DecryptPass(widget._chequeModel.sortCode),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MICRE13B',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,

                    ),
                    child: Center(
                      child: Text(
                        widget._chequeModel.accountno,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'MICRE13B',
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }

}
