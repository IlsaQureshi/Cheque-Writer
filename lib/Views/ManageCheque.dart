import 'package:chequewallet/Controllers/ManageChequeController.dart';
import 'package:chequewallet/Model/ChequeModel.dart';
import 'package:chequewallet/Model/ManageChequeModel.dart';
import 'package:chequewallet/Views/Drawer.dart';
import 'package:chequewallet/Views/EditCheque.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/TransactionAuth.dart';
import 'package:chequewallet/Views/View_Cheque.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageCheque extends StatefulWidget {
  @override
  State<ManageCheque> createState() => _ManageChequeState();
}

class _ManageChequeState extends State<ManageCheque> {
  var _c=Get.put(ManageChequeController());

  var indexes=[];

  bool allSelected=false;

  @override
  Widget build(BuildContext context) {
    return GetX<ManageChequeController>(
      builder: (_) {
        return  _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Manage Cheque"),
          ),
          drawer: MyDrawer(),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.all(20),
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 2)
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.search,color: Colors.black,size: 30,),
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(color: Colors.black,width: 2))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _items("Select all", allSelected, (bool? val){
                      allSelected=val!;
                      indexes.clear();
                      if(allSelected)
                        {
                          for(int i=0;i<_.cheques.length;i++) {
                            indexes.add(i);
                            _.cheques[i].chequeModel.selected=true;
                          }
                        }
                      else {
                        indexes.clear();
                        for(int i=0;i<_.cheques.length;i++) {
                          _.cheques[i].chequeModel.selected=false;
                        }
                      }
                      setState(() {

                      });

                    }),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(onTap: (){
                            Delete(_);
                          },
                            child: Icon(Icons.delete),),
                          InkWell(onTap: (){
                            Delete(_);
                          },child: Text("Delete"))
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _.cheques.length,
                  itemBuilder: (context,index){
                    bool selected=false;
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey,))
                      ),
                      child: ListTile(

                        leading:  Checkbox(
                          value: allSelected ? allSelected : _.cheques[index].chequeModel.selected,
                          onChanged:(bool? val){
                            _.cheques[index].chequeModel.selected=val!;
                            if(_.cheques[index].chequeModel.selected)
                              indexes.add(index);
                            else
                              indexes.remove(index);
                            setState(() {

                            });
                          },
                        ),
                        title: Text("Cheque ${index}",style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text(_.cheques[index].chequeModel.payee),
                        trailing: PopupMenuButton(
                          child: Icon(Icons.more_horiz,size: 30,color: Colors.black,),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: FlatButton.icon(onPressed: ()async{
                                  indexes.clear();
                                  indexes.add(index);
                                  await Delete(_);
                                }, icon: Icon(Icons.delete), label: Text("Delete")),
                              ),
                            PopupMenuItem(
                            child: FlatButton.icon(onPressed: (){
                            Get.to(()=> EditCheque(model:_.cheques[index]));
                            }, icon: Icon(Icons.edit), label: Text("Edit Cheque")),
                            ),
                              PopupMenuItem(
                                child: FlatButton.icon(onPressed: (){
                                  Get.to(()=> TransactionAuth(ViewCheque(_.cheques[index].chequeModel)));
                                }, icon: Icon(Icons.person_sharp), label: Text("View Cheque")),
                              ),
                            ];
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }

  Widget _items(String title,bool value,var onChange,)
  {
    return Expanded(
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged:onChange,
          ),
          Text(title)
        ],
      ),
    );
  }

  Future Delete(ManageChequeController controller,)async
  {
    controller.isLoading.value=true;
    final ref=FirebaseDatabase.instance.ref("cheques").child(FirebaseAuth.instance.currentUser!.uid);
    for(int i=0;i<indexes.length; i++)
      {
        if(controller.cheques[i].chequeModel.selected==true)
          {
            await ref.child(controller.cheques[i].key).remove();
          }
      }
    indexes.clear();
    controller.isLoading.value=false;
  }
}
