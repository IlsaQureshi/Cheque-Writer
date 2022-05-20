import 'package:chequewallet/Widgets/TextWidget.dart';
import 'package:flutter/material.dart';

class ChequeDigitalized extends StatelessWidget {
  const ChequeDigitalized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheque Digitalised"),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            margin: EdgeInsets.all(20),
            decoration:const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/check.png")
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Text("Cheque is Successfully added to your account",textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
          ),
          TextWidget("you can now manage your cheques from the cheque management section.")
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Row(
          children: [
            btn(context),
          ],
        ),
      ),
    );
  }
  Widget btn(BuildContext context)
  {
    return InkWell(
      onTap: (){},
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.close_outlined,size: 20,),
            Text("Close",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
