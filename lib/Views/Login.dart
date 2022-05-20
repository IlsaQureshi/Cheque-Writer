
import 'package:chequewallet/Controllers/LoginController.dart';
import 'package:chequewallet/Views/ChequeBg.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/SignUp.dart';
import 'package:chequewallet/Views/forgetPass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/BottomButtons.dart';

class Login extends StatelessWidget {

  final txtEmail=TextEditingController();
  final txtPass=TextEditingController();
  var _c=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetX<LoginController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : ChequeBg(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body:

            SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 100,),
                Image.asset("assets/Splash.png"),
                SizedBox(
                  height: 100,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),

                    child:
                Column( mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    TextField(
                        controller: txtEmail,
                        decoration:const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black,width: 30.0,style: BorderStyle.solid)
                            ),
                         hintText: "Enter Email Here"
                        ) ,
                    ),
                    SizedBox(height: 30,),
                    Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    TextField(
                      controller: txtPass,
                      decoration:const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,width: 30.0,style: BorderStyle.solid)
                          ),
                          hintText: "Enter Password Here"
                      ) ,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                          onTap: (){
                            Get.to(ForgetPass());
                          },
                          child: Text("Forgot password ?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: (){
                          Get.to(SignUp());
                        },
                          child: Text("create an account?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                  ],
                )
                ),
              ],
                ),
            ),
            bottomNavigationBar:Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: ()async{
                      await _.Login(txtEmail.text, txtPass.text);

                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width*0.3,
                      decoration: BoxDecoration(
                        color: Colors.cyan.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Container(
                            child: Center(
                              child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_right_outlined),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),


          ),
        );
      }
    );
  }
}
