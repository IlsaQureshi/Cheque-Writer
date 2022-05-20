import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  var onBack;
  String leftTitle;
  String rightTitle;
  var leftIcon;
  var rightIcon;
  var onNext;
  BottomButtons({required this.leftTitle,required this.leftIcon,required this.onBack,required this.rightTitle,required this.rightIcon,required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          btn(context, this.onBack),
          btnNext(Icons.keyboard_arrow_right,context, this.onNext)
        ],
      ),
    );
  }
  Widget btn(BuildContext context,var onpress)
  {
    return InkWell(
      onTap: onpress,
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(this.leftIcon,size: 20,),
            Text(this.leftTitle,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
  Widget btnNext(var icon,BuildContext context,var ontap)
  {

    return InkWell(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width*0.3,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.cyan.withOpacity(0.3),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(this.rightTitle,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            Icon(this.rightIcon,)
          ],
        ),
      ),
    );
  }
}
