import 'package:chequewallet/Views/Drawer.dart';
import 'package:chequewallet/Widgets/BottomButtons.dart';
import 'package:chequewallet/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class UploadCheque extends StatelessWidget {
  const UploadCheque({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Cheque"),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          TextWidget("Please check the details on the cheque carefully before clicking done"),
          cheque(context),
          TextWidget("Do you wish to continue or try another image file ?")
        ],
      ),
      bottomNavigationBar: BottomButtons(
        leftTitle: "Try again",
        leftIcon: Icons.repeat,
        onBack: (){},
        rightTitle: "Continue",
        rightIcon: Icons.keyboard_arrow_right,
        onNext: (){},
      ),
    );
  }
  Widget cheque(BuildContext context)
  {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const[
                Text("Payee"),
                Text("28-12-2021"),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Two hundred only"),
                Text("£200"),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black,),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("12312")),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("12312")),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Text("12312")),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
