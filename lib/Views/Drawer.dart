import 'package:chequewallet/Controllers/LoginController.dart';
import 'package:chequewallet/Views/Add_Bank_Account.dart';
import 'package:chequewallet/Views/Create_Cheque.dart';
import 'package:chequewallet/Views/Create_Invoice.dart';
import 'package:chequewallet/Views/Create_Payee.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/DigitalizeSignature.dart';
import 'package:chequewallet/Views/Login.dart';
import 'package:chequewallet/Views/ManageAccounts.dart';
import 'package:chequewallet/Views/ManageCheque.dart';
import 'package:chequewallet/Views/ManageInvoices.dart';
import 'package:chequewallet/Views/ManagePayee.dart';
import 'package:chequewallet/Views/Settings.dart';
import 'package:chequewallet/Views/SentEmails.dart';
import 'package:chequewallet/Views/Upload%20Cheque.dart';
import 'package:chequewallet/Views/UploadImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade800,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text(userModel.value.fname+" "+userModel.value.lname,style: TextStyle(color: Colors.grey,fontSize: 16),)),
              ),
              SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.dashboard,color: Colors.white,),
                title: Text("Dashboard",style: TextStyle(color: Colors.white)),
                onTap: (){
                  print("clicked");
                  Get.offAll(()=>Dashboard());
                },
              ),
              _Payee(),
              _Cheque(),
              _Invoice(),
              _Bank(),
              SizedBox(height: 20,),
              ListTile(
                leading: Icon(Icons.settings,color: Colors.white,),
                title: Text("Settings" ,style: TextStyle(color: Colors.white)),
                onTap: (){
                  print("clicked");
                  Get.offAll(()=>Settings());
                },
              ),


              ListTile(
                leading: Icon(Icons.logout,color: Colors.white,),
                title: Text("Logout",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                onTap: ()async{
                  FirebaseAuth.instance.signOut();
                  final pref=await SharedPreferences.getInstance();
                  pref.clear();
                  Get.offAll(()=>Login());
                },
              ),



            ],
          ),
        ),
      ),
    );
  }
  Widget _Payee()
  {
    return Container(
        child:  ExpansionTile(
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          leading:  Icon(Icons.person,color: Colors.white,size: 20,),
          title: Text("Payee",style: TextStyle(color: Colors.white),),
          children: [
            Padding(
              padding:EdgeInsets.only(left:20),
              child: ListTile(
                onTap: (){
                  Get.to(()=>CreatePayee());
                },
                leading: Icon(Icons.edit,color: Colors.white,),
                title: Text("Create Payee",style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(
              padding:EdgeInsets.only(left:20),
              child: ListTile(
                onTap: (){
                  Get.to(()=>ManagePayee());
                },
                leading: Icon(Icons.manage_accounts,color: Colors.white,),
                title: Text("Manage Payees",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],

        )
    );
  }
  Widget _Bank()
  {
    return Container(
        child:  ExpansionTile(
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          leading:  Icon(Icons.account_balance_wallet,color: Colors.white,size: 20,),
          title: Text("Bank Account",style: TextStyle(color: Colors.white)),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: (){
                  Get.to(()=>Add_Bank_Account());
                },
                leading: Icon(Icons.edit,color: Colors.white,),
                title: Text("Add Bank Account",style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: (){
                  Get.to(ManageAccounts());
                },
                leading: Icon(Icons.manage_accounts,color: Colors.white,),
                title: Text("Manage Bank Account",style: TextStyle(color: Colors.white)),
              ),
            ),
          ],

        )
    );
  }
  Widget _Invoice()
  {
    return Container(

        child:  ExpansionTile(
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          leading:  Icon(Icons.person,color: Colors.white,size: 20,),
          title: Text("Invoice",style: TextStyle(color: Colors.white)),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: (){
                  Get.to(()=>CreateInvoice());
                },
                leading: Icon(Icons.edit,color: Colors.white,),
                title: Text("Create Invoice",style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: ListTile(
                onTap: (){
                  Get.to(ManageInvoices());
                },
                leading: Icon(Icons.manage_accounts,color: Colors.white,),
                title: Text("Manage Invoices",style: TextStyle(color: Colors.white)),
              ),
            ),
          ],

        )
    );
  }

  Widget _Cheque()
  {
    return Container(
        child:  ExpansionTile(
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
        leading:  Icon(Icons.credit_card_outlined,color: Colors.white,size: 20,),
    title: Text("Cheque",style: TextStyle(color: Colors.white)),
    children: [
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: ListTile(
        onTap: (){
          Get.to(CreateCheque());
        },
      leading: Icon(Icons.edit,color: Colors.white,),
      title: Text("Create Cheque",style: TextStyle(color: Colors.white)),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: ListTile(
        onTap: (){
          Get.to(()=>ManageCheque());
        },
      leading: Icon(Icons.manage_accounts,color: Colors.white,),
      title: Text("Manage Cheques",style: TextStyle(color: Colors.white)),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: ListTile(
        onTap: (){
          Get.to(()=>UploadImage());
        },
      leading: Icon(Icons.upload_rounded,color: Colors.white,),
      title: Text("Upload Cheque",style: TextStyle(color: Colors.white)),
      ),
    ),
    Padding(
      padding: EdgeInsets.only(left: 20),
      child: ListTile(
        onTap: (){
          Get.to(()=>DigitalizeSignature());
        },
  leading: Icon(Icons.fit_screen,color: Colors.white,),
  title: Text("Digitalized Signatures",style: TextStyle(color: Colors.white)),
  ),
    ),
  ],

        )
    );
  }
}
