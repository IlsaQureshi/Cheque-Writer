// ignore_for_file: prefer_const_constructors

import 'package:chequewallet/Controllers/DashboardController.dart';
import 'package:chequewallet/Views/LoadingScreen.dart';
import 'package:chequewallet/Views/ManageCheque.dart';
import 'package:chequewallet/Views/ManageInvoices.dart';
import 'package:chequewallet/Views/Settings.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:get/get.dart';

import 'Drawer.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  var _c=Get.put(DashboardController());
  List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: Colors.blue,
      data: [0, 0,0, 0, 0],

    ),
  ];
  List<String> Cheque=["Cheque Name 1","Cheque Name 2"];
  List<String> Invoices=["Invoices Name 1","Invoices Name 2"];
  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
      builder: (controller) {
        return controller.isLoading.isTrue ? LoadingScreen() : Scaffold(

          appBar:AppBar(title: Text("Dashboard",
            style: TextStyle(fontWeight: FontWeight.bold),),
            backgroundColor: Colors.black,
            actions: [
              IconButton(onPressed: (){
                Get.to(()=>Settings());
              }, icon: Icon(Icons.settings,color: Colors.white,size: 30,)),
              SizedBox(width: 20,),
            ],
          ),
          drawer: MyDrawer(),
          body:
          SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 5,right: 5,bottom: 5),
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.lightGreen),
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child:
                    // Graph Place
                  LineGraph(
                    features: [Feature(
                      title: "ammount",
                        data: controller.total.value)],
                    size: Size(600, 100),
                    labelX: ['1', '2', '3', '4', '5','6','7','8','9','10','11','12'],
                    labelY: ['200£', '500£', '1000£', '2000£', '4000£'],
                    showDescription: false,
                    graphColor: Colors.black,
                    graphOpacity: 0.0,
                    verticalFeatureDirection: true,
                    descriptionHeight: 130,
                  )

                ),

                Container(
                  padding: EdgeInsets.all(10),
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card,color: Colors.black,size: 45,),
                          Expanded(
                            child: Text(" Recently Created Cheques",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          InkWell(
                            onTap: (){
                              Get.to(()=>ManageCheque());
                            },
                              child: Text("view   "))
                        ],
                      ),
                     Expanded(
                       child: ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                           itemCount: controller.cheques.length,
                           itemBuilder: (context, index) {
                             return Container(
                               height: 30,
                               child: ListTile(
                                 title: Text("Cheque ${index}",style: TextStyle(fontWeight: FontWeight.bold)),
                               )
                             );
                           }),
                     )


                    ],
                  ),
                ),


                Container(
                  padding: EdgeInsets.all(10),
                  height: 210,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightGreen),
                      borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Icon(Icons.sticky_note_2_sharp,color: Colors.black,size: 45,),
                          Expanded(
                            child: Text(" Recently Created Invoices",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          InkWell(
                              onTap: (){
                                Get.to(()=>ManageInvoices());
                              },
                              child: Text("view   ")),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.invoices.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  height: 30,
                                  child: ListTile(
                                    title: Text("Invoice ${index}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  )
                              );
                            }),
                      ),


                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      }
    );
  }
}

