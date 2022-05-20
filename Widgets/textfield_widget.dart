import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  String txtLabel;

  TextFieldWidget(this.textController,this.txtLabel);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
              child: Text(txtLabel,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 2),
              padding: EdgeInsets.symmetric(horizontal: 2),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1.0),
              ),
              child: Center(
                child: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
