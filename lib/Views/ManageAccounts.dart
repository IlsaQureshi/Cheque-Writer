import 'package:chequewallet/Controllers/ManageAccountsController.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/View_Payee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageAccounts extends StatefulWidget {


  @override
  State<ManageAccounts> createState() => _ManageAccountsState();
}

class _ManageAccountsState extends State<ManageAccounts> {
  var indexes=[];

  bool allSelected=false;
  var _c=Get.put(ManageAccountsController());

  @override
  Widget build(BuildContext context) {
    return GetX<ManageAccountsController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Manage Accounts"),
          ),
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
                  children: [
                    _items("Select all", allSelected, (bool? val){
                      allSelected=val!;
                      if(allSelected)
                      {
                        for(int i=0;i<_.accounts.length;i++) {
                          indexes.add(i);
                          _.accounts[i].bankAccountsModel.selected=true;
                        }
                      }
                      else {
                        indexes.clear();
                        for(int i=0;i<_.accounts.length;i++) {
                          indexes.add(i);
                          _.accounts[i].bankAccountsModel.selected=false;
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
                  itemCount: _.accounts.length,
                  itemBuilder: (context,index){
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey,))
                      ),
                      child: ListTile(
                        leading:  Checkbox(
                          value: allSelected ? allSelected : _.accounts[index].bankAccountsModel.selected,
                          onChanged:(bool? val){
                            _.accounts[index].bankAccountsModel.selected=val!;
                            if(_.accounts[index].bankAccountsModel.selected)
                              indexes.add(index);
                            else
                              indexes.remove(index);
                            setState(() {

                            });
                          },
                        ),
                        title: Text(_.accounts[index].bankAccountsModel.bank,style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: PopupMenuButton(
                          child: Icon(Icons.more_horiz,size: 30,color: Colors.black,),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: FlatButton.icon(onPressed: ()async{
                                  indexes.add(index);
                                  await Delete(_);
                                }, icon: Icon(Icons.delete), label: Text("Delete")),
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
  Future Delete(ManageAccountsController controller,)async
  {
    controller.isLoading.value=true;
    final ref=FirebaseDatabase.instance.ref("bankAccounts").child(FirebaseAuth.instance.currentUser!.uid);
    for(int i=0;i<indexes.length; i++)
    {
      await ref.child(controller.accounts[indexes[i]].key).remove();
    }
    indexes.clear();
    controller.isLoading.value=false;
  }
}
