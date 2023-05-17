import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../MyColors.dart';
import 'TextWidget.dart';

class CardHomeWidget extends StatelessWidget{
  late int text1_data;
  late int text2_data;
  late String heading1,heading2,heading3;
  late String text3;

  CardHomeWidget({Key? key, required this.text1_data,required this.text2_data,required this.text3,required this.heading1,required this.heading2,required this.heading3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors.whiteColor,
      elevation: 30,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: MyColors.blackColor24, width: 1.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/bell.png',
              scale: 10,
            ),
          ),
          Divider(
            thickness: 1,
            color: MyColors.blackColor48,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    input:heading1,
                    fontsize: 15,
                    fontWeight: FontWeight.bold,
                    textcolor: MyColors.blueColor),
                TextWidget(
                    input:text1_data.toString() ,
                    fontsize: 15,
                    fontWeight: FontWeight.bold,
                    textcolor: MyColors.navyblue),
              ],
            ),
          ),



        ],
      ),
    );
  }

}