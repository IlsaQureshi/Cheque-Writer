import 'package:chequewallet/Controllers/SettingsController.dart';
import 'package:chequewallet/Validation/Validation.dart';
import 'package:chequewallet/Views/BottomButtons.dart';
import 'package:chequewallet/Views/Dashboard.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'Drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Settings extends StatefulWidget {


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final txtcurrent=TextEditingController();
  final txtpass=TextEditingController();
  final txtcpas=TextEditingController();
  final tpass=TextEditingController();
  final ctpas=TextEditingController();
  var _c=Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GetX<SettingsController>(
      builder: (_) {

        return  _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Settings"),
          ),
          drawer: MyDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                  alignment: Alignment.centerLeft,
                    child: Text("Password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                MyField("current password",txtcurrent),
                MyField("New Password",txtpass),
                MyField("Confirm password",txtcpas),
                _Button("update password",(){
                  if(txtpass.text!=txtcpas.text)
                    {
                      ShowErrorAlert("password not matched try again");
                    }
                  else
                    _.changePassword(txtcurrent.text,txtpass.text);
                }),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text("Transaction password",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                MyField("New transaction pass",tpass),
                MyField("Confirm transaction pass",ctpas),
                _Button("update transaction pass",(){
                  if(tpass.text.isEmpty || ctpas.text.isEmpty)
                    ShowErrorAlert("can't submit an empty field");
                  else if(tpass.text!=ctpas.text)
                    ShowErrorAlert("transaction password not matched");
                  else
                  _.changeTransactionPass(tpass.text);
                }),

              ],
            ),
          ),
          bottomNavigationBar: BottomButtons(
          leftTitle: "Back",
          leftIcon: Icons.keyboard_arrow_left,
          onBack: () {
            Get.off(()=>Dashboard());
          },
          rightTitle: "Done",
          rightIcon: Icons.keyboard_arrow_right,
          onNext: () {
            Get.off(()=>Dashboard()); 
          }
          ),
        );
      }
    );
  }

  Widget _Button(String txt,var onTap)
  {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width*0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(child: Text(txt,style: TextStyle(color: Colors.white),),),
        ),
      ),
    );
  }

  Widget MyField(String hint,var controller)
  {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 5),
      child: TextField(
        obscureText: true,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black,
                )
            )
        ),
      ),
    );
  }
}
