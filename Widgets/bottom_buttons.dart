import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottomButtons extends StatelessWidget {
  String title;
  var icon;
  var ontap;
  String title1;
  var icon1;
  var ontap1;
  double top;

  BottomButtons(this.icon, this.title, this.ontap, this.title1, this.icon1,
      this.ontap1, this.top);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: InkWell(
              onTap: ontap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    icon,
                    size: 20,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          Container(
              height: 30,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: InkWell(
                onTap: ontap1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      title1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Icon(
                      icon1,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
