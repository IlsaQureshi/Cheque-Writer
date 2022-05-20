import 'package:flutter/material.dart';

import 'BottomButtons.dart';
import 'ForgetMemorableInformation.dart';

class ResetInformation extends StatelessWidget {
   ResetInformation({Key? key}) : super(key: key);

  ForgetMemorableInformation  obj1=ForgetMemorableInformation();
   final new_memorable_information=TextEditingController();
   final reenter_new_memorable_information=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Information",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body:
      SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 30),
            Container(
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               border: Border.all(color: Colors.black,width: 4)
              ),

              child:
              Center(child: Text("!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),))
            ),

            SizedBox(height: 30),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Text("Here You Can Reset Your Memorable Information",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.5),
                )
            ),

            SizedBox(height: 20),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 11),
                child: Text("The Memorable Information should at least contain 8 characters",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                )
            ),
            SizedBox(height: 60),
            obj1.TextField1("NEW MEMORABLE INFORMATION", "", 20, 20,new_memorable_information),
            SizedBox(height: 40),
            obj1.TextField1("RE-ENTER NEW MEMORABLE INFORMATION", "", 20, 20,reenter_new_memorable_information),

            SizedBox(height: 60),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Note: for your own security please don't enter any kind of personal data for the memorable information to remember(e.g name, birthday, address, user id, etc).",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtons(onBack: (){}, onNext:(){}, rightIcon: Icons.update, leftIcon: Icons.cancel, leftTitle: 'Cancel', rightTitle: 'Update',),

    );
  }

}
