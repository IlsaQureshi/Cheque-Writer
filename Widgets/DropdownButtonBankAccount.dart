import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:flutter/material.dart';

import '../Model/AccountsModel.dart';


class DropdownButtonBankAccount extends StatelessWidget {


  // List of items in our dropdown menu
  AccountsModel dropdownvalue;
  List<AccountsModel> items;
  String txtLabel;
  var onchange;
  DropdownButtonBankAccount({required this.dropdownvalue,required this.txtLabel,required this.items,required this.onchange});


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.centerLeft,
              child: Text(txtLabel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 2),

                  padding: EdgeInsets.symmetric(horizontal: 2),
                  height: 40,

                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: items.length < 1 ? Center(child: Text("No Bank Available"),) : DropdownButton<AccountsModel>(

                    isExpanded: true,
                    elevation: 0,
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((AccountsModel item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.bankAccountsModel.bank,
                          style: TextStyle(fontSize: 10),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: onchange,

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
