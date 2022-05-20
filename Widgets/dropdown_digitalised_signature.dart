import 'package:chequewallet/Model/AllSignatureModel.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:flutter/material.dart';


class DropdownDigitalisedSignature extends StatelessWidget {

  AllSignatureModel dropdownvalue;
  String txtLabel;
  List<AllSignatureModel> items;
  var onchange;
  DropdownDigitalisedSignature({required this.dropdownvalue,required this.txtLabel,required this.items,required this.onchange});

  // List of items in our dropdown menu


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
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: items.length < 1 ? Center(child: Text("No Signature added"),) : DropdownButton<AllSignatureModel>(
                    // Initial Value
                    value: dropdownvalue,
                    isExpanded:true,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((AllSignatureModel item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item.signModel.name,style: TextStyle(fontSize: 10),),
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