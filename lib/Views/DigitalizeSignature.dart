
import 'package:chequewallet/Controllers/SignatureController.dart';
import 'package:chequewallet/Model/AllSignatureModel.dart';
import 'package:chequewallet/Views/Drawer.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/ViewSignature.dart';
import 'package:chequewallet/Widgets/SignatureWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Validation/Validation.dart';

class DigitalizeSignature extends StatefulWidget
{
  @override
  State<DigitalizeSignature> createState() => _DigitalizeSignatureState();
}

class _DigitalizeSignatureState extends State<DigitalizeSignature> {
  var _c=Get.put(SignatureController());

  var indexes = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetX<SignatureController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Digitalized Signature"),
          ),
          drawer: MyDrawer(),
          body: Column(
            children: [
              Container(
                margin:const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                child: Text("You can directly add your signature to your cheques before printing them out.",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _.signs.length,
                  itemBuilder: (context,index){
                    return item(index,_);
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: (){
              Get.to(()=>SignatureWidget());
            },
            child: Center(child: Icon(Icons.add),),
          ),
        );
      }
    );
  }

  Widget item(int index,SignatureController controller)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey,width: 2),bottom: BorderSide(color: Colors.grey,width: 2))
      ),
      child: Row(
        children: [
          Text("${index}",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
          SizedBox(width: 20,),
          Text(controller.signs[index].signModel.name,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                child: Icon(Icons.more_horiz,size: 30,),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: FlatButton.icon(onPressed: ()
                        async{
                                  indexes.clear();
                                  indexes.add(index);
                                  Delete(controller.signs[index]);
                      }, icon: Icon(Icons.delete), label: Text("Delete")),
                    ),
                    PopupMenuItem(
                      child: FlatButton.icon(onPressed: (){
                        Get.to(()=>ViewSignature(url:controller.signs[index].signModel.sign));
                      }, icon: Icon(Icons.person), label: Text("View")),
                    ),
                  ];
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Future Delete(AllSignatureModel model,)async
  {

   try{
     final ref=FirebaseDatabase.instance.ref("signature").child(FirebaseAuth.instance.currentUser!.uid);
     ref.child(model.key).remove();
     indexes.clear();
     Get.snackbar("Success", "Deleted Successfully",backgroundColor: Colors.green);
   }catch(e)
    {
      ShowErrorAlert(e.toString());
    }

  }
}
