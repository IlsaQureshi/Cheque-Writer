import 'package:chequewallet/Views/Login.dart';
import 'package:chequewallet/Views/View_Cheque.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Email Sent'),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: Image.asset(
                    'assets/check.png',
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'please verify your email and login again',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Verification Link has been sent to your email',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      onPressed: ()async{
                        await FirebaseAuth.instance.signOut();
                        Get.offAll(()=>Login());
                      },
                      child: Text("logout"),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      //   child:Row(
      //     children: [
      //       InkWell(
      //         onTap: (){
      //           // Get.offAll(()=>ViewCheque());
      //         },
      //         child: Container(
      //           width: MediaQuery.of(context).size.width*0.3,
      //           padding: EdgeInsets.symmetric(vertical: 10),
      //           decoration: BoxDecoration(
      //               border: Border.all(color: Colors.black),
      //               borderRadius: BorderRadius.circular(10)
      //           ),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Icon(Icons.close,size: 20,),
      //               Text("Close",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
      //               )
      //             ],
      //           ),
      //         ),
      //       )
      //     ],
      //   )
      // ),
    );
  }
}
