import 'package:chequewallet/Controllers/ManagePayeeController.dart';
import 'package:chequewallet/Views/Edit_Payee.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/View_Payee.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagePayee extends StatefulWidget {
  @override
  State<ManagePayee> createState() => _ManagePayeeState();
}

class _ManagePayeeState extends State<ManagePayee> {
  var _c=Get.put(ManagePayeeController());

  final txtSearch=TextEditingController();
  var indexes=[];

  bool allSelected=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtSearch.addListener(() {
      print("hello");
      setState(() {

      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return GetX<ManagePayeeController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Manage Payee"),
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
                    controller: txtSearch,
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
                        for(int i=0;i<_.payees.length;i++) {
                          indexes.add(i);
                          _.payees[i].payee.selected=true;
                        }
                      }
                      else {
                        indexes.clear();
                        for(int i=0;i<_.payees.length;i++) {
                          _.payees[i].payee.selected=false;
                        }
                      }
                      setState(() {

                      });
                    }),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                  itemCount: _.payees.length,
                  itemBuilder: (context,index){
                    return _.payees[index].payee.nickname.toLowerCase().startsWith(txtSearch.text.toLowerCase()) ? Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(horizontal: BorderSide(color: Colors.grey,))
                      ),
                      child: ListTile(
                        leading:  Checkbox(
                          value: allSelected ? allSelected : _.payees[index].payee.selected,
                          onChanged:(bool? val){
                            _.payees[index].payee.selected=val!;
                            if(_.payees[index].payee.selected)
                              indexes.add(index);
                            else
                              indexes.remove(index);
                            setState(() {

                            });
                          },
                        ),
                        title: Text(_.payees[index].payee.nickname,style: TextStyle(fontWeight: FontWeight.bold),),
                        trailing: PopupMenuButton(
                          child: Icon(Icons.more_horiz,size: 30,color: Colors.black,),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: FlatButton.icon(onPressed: (){
                                  Get.off(()=>EditPayee(model: _.payees[index]));
                                }, icon: Icon(Icons.edit), label: Text("Edit")),

                              ),
                              PopupMenuItem(
                                child: FlatButton.icon(onPressed: (){
                                  indexes.clear();
                                  indexes.add(index);
                                  Delete(_);
                                }, icon: Icon(Icons.delete), label: Text("Delete")),
                              ),
                              PopupMenuItem(
                                child: FlatButton.icon(onPressed: (){
                                  Get.to(()=>ViewPayee(payee: _.payees[index].payee,isSubmission: false,Key: _.payees[index].key,));
                                }, icon: Icon(Icons.person_sharp), label: Text("View Payee")),
                              ),
                            ];
                          },
                        ),
                      ),
                    ) : Container();
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
  Future Delete(ManagePayeeController controller,)async
  {
    controller.isLoading.value=true;
    final ref=FirebaseDatabase.instance.ref("Payee");
    for(int i=0;i<indexes.length; i++)
    {
      if(_c.payees[i].payee.selected==true)
        {
          await ref.child(controller.payees[i].key).remove();
        }
    }
    indexes.clear();
    controller.isLoading.value=false;
  }
}
