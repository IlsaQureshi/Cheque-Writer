import 'package:chequewallet/Controllers/InvoiceController.dart';
import 'package:chequewallet/Views/InvoiceImage.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/TransactionAuth.dart';
import 'package:chequewallet/Views/View_Invoice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageInvoices extends StatefulWidget {


  @override
  State<ManageInvoices> createState() => _ManageInvoicesState();
}

class _ManageInvoicesState extends State<ManageInvoices> {
  var _c=Get.put(InvoiceController());
  final txtSearch=TextEditingController();
  var indexes=[];

  bool allSelected=false;
  @override
  Widget build(BuildContext context) {
    return GetX<InvoiceController>(
      builder: (_) {
        return _.isLoading.isTrue ? LoadingScreen() : Scaffold(
          appBar: AppBar(
            title: Text("Manage Invoices"),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.all(20),
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2)),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      // contentPadding: EdgeInsets.all(5),
                      border: InputBorder.none,
                      hintText: "Search",
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: _.invoices.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(
                        color: Colors.grey,
                      ))),
                      child: ListTile(

                        title: Text(
                          "Invoice ${index}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: PopupMenuButton(
                          child: Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Colors.black,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: FlatButton.icon(
                                    onPressed: () {
                                      Get.to(()=>TransactionAuth(InvoiceImage(_.invoices[index].image.invoice)));
                                    },
                                    icon: Icon(Icons.person),
                                    label: Text("View")),
                              ),
                              PopupMenuItem(
                                child: FlatButton.icon(
                                    onPressed: () {
                                      indexes.clear();
                                      indexes.add(index);
                                      Delete(_);
                                    },
                                    icon: Icon(Icons.delete),
                                    label: Text("Delete")),
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

  Widget _items(
    String title,
    bool value,
    var onChange,
  ) {
    return Expanded(
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChange,
          ),
          Text(title)
        ],
      ),
    );
  }
  Future Delete(InvoiceController controller,)async
  {
    controller.isLoading.value=true;
    final ref=FirebaseDatabase.instance.ref("invoice").child(FirebaseAuth.instance.currentUser!.uid);
    for(int i=0;i<indexes.length; i++)
    {
      await ref.child(controller.invoices[indexes[i]].key).remove();
    }
    indexes.clear();
    controller.isLoading.value=false;
  }
}
