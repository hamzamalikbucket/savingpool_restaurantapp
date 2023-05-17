import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BtnNullHeightWidth extends StatelessWidget{
  String title;
  Color bgcolour;
  Color disablecolor;
  Color textcolour;
  late ValueChanged<String> value;
  late VoidCallback onPress;
  late double width;
  late double height;


  BtnNullHeightWidth({Key? key, required this.title,required this.bgcolour,required this.disablecolor,required this.textcolour, required this.onPress,required this.width,required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: width,
     height: height,
      child: ElevatedButton(
        onPressed: ()=> onPress(),
        style:ElevatedButton.styleFrom(
            backgroundColor: bgcolour,


            disabledForegroundColor: disablecolor.withOpacity(0.38), disabledBackgroundColor: disablecolor.withOpacity(0.12),
          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: bgcolour, width:1.0))
        ),

        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textcolour, fontSize: 18, fontWeight: FontWeight.normal,),
        ),
      ),
    );
  }


}