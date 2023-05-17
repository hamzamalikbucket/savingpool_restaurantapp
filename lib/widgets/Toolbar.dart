

import 'package:flutter/material.dart';

import '../MyColors.dart';
import 'TextWidget.dart';

class ToolbarBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;

  const ToolbarBack({Key? key, required this.title,required  this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
        AppBar(
          backgroundColor: MyColors.whiteColor,
//`true` if you want Flutter to automatically add Back Button when needed,
          automaticallyImplyLeading: true,
            centerTitle: true,

          title:TextWidget(
              input: title,
              fontsize: 16,
              fontWeight: FontWeight.bold,
              textcolor: MyColors.black),
          iconTheme: IconThemeData(
            color: MyColors.black,

            //change your color here
          ),
        ));
  }

  @override
  Size get preferredSize =>Size.fromHeight(appBar.preferredSize.height);
}
