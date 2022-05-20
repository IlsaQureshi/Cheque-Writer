import 'package:flutter/material.dart';

import 'BottomButtons.dart';

class LoadingPage3 extends StatelessWidget {
  const LoadingPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            SizedBox(height: 100,),
            Image.asset("images/Splash.png"),
            SizedBox(
              height: 100,
            ),

            Container(
                margin: EdgeInsets.symmetric(horizontal: 50),

                child:
               Text("Cant find your account on our database. Please create a new account or of account is not verified pleasee verify.",
                 textAlign: TextAlign.justify,
                 style:TextStyle(fontSize: 15),),
            ),
SizedBox(height: 80),
            Text1(Icon(Icons.edit), "Create your account",""),
            SizedBox(height: 10),
            Text1(Icon(Icons.check), "Verify Email",""),
            SizedBox(height: 10),
            Text1(Icon(Icons.email), "Contact Us",""),
          ],
        ),
      ),
     // bottomNavigationBar: BottomButtons(onBack: (){}, onNext:(){}),

    );
  }

  Widget Text1(Icon icon, String data,String link){
    return InkWell(
      onTap: (){

      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         icon,
          Text(data,style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 17,)
          )




        ],
      ),
    );

  }
}
