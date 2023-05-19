import 'dart:convert';

import 'package:bottom_loader/bottom_loader.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:savingpool_restaurantapp/Screens/NavigationScreen.dart';


import '../Constants.dart';
import '../MyColors.dart';
import '../Utils.dart';

import '../widgets/BtnNullHeightWidth.dart';
import '../widgets/EmailInputWidget.dart';
import '../widgets/NameInputWidget.dart';
import '../widgets/TextWidget.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _SignKey = GlobalKey<FormState>();

  late String memberId, pass, message;
  late BottomLoader bl;
  void initState() {
    // TODO: implement initState
    bl = BottomLoader(context,
        isDismissible: true,
        showLogs: true,
        loader: CircularProgressIndicator(
          color: MyColors.blue,
        ));
    bl.style(
        message: 'Please Wait...',
        backgroundColor: MyColors.darkgreenColor,
        messageTextStyle: TextStyle(
            color: MyColors.darkgreenColor,
            fontSize: 19.0,
            fontWeight: FontWeight.w600));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(Utils.APP_PADDING),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/restaurant.png',
                              width: 170,
                            ),
                            TextWidget(
                                input: "Login to your account to continue",
                                fontsize: 18,
                                fontWeight: FontWeight.w500,
                                textcolor: MyColors.black),
                          ],
                        ),
                      ),
                      SizedBox(child: form(context)),
                      Utils.FORM_HINT_PADDING,
                      Utils.FORM_HINT_PADDING,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget form(BuildContext context) {
    return Form(
        key: _SignKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NameInputWidget(
                title: "Restaurant ID",
                error: "Enter Your ID",
                isRequired: true,
                icon: Icons.card_membership_outlined,
                keyboardType: TextInputType.text,
                value: (val) {
                  memberId = val!;
                },
                width: MediaQuery.of(context).size.width,
                validate: true,
                isPassword: false,
                hintcolour: MyColors.whiteColor),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            NameInputWidget(
                title: "Password",
                error: "Enter Your Password",
                isRequired: true,
                icon: Icons.lock,
                keyboardType: TextInputType.text,
                value: (val) {
                  pass = val!;
                },
                width: MediaQuery.of(context).size.width,
                validate: true,
                isPassword: true,
                hintcolour: MyColors.whiteColor),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            BtnNullHeightWidth(
              title: "Login",
              bgcolour: MyColors.blue,
              disablecolor: MyColors.yellowColor,
              textcolour: MyColors.whiteColor,
              onPress: () {

                final form = _SignKey.currentState;
                form!.save();

                  bl.display();

                  try {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => NavigationScreen(),
                      ),
                          (route) => false,
                    );


                  } catch (e) {
                    bl.close();
                    confirmationPopup(
                        context, "An error Occurred.Try again later!");
                  }

              },
              width: MediaQuery.of(context).size.width,
              height: 48,
            ),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,

          ],
        ));
  }



  confirmationPopup(BuildContext dialogContext, String? error) {
    var alertStyle = const AlertStyle(
      animationType: AnimationType.grow,
      overlayColor: Colors.black87,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      titleStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
      descStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
      animationDuration: Duration(milliseconds: 400),
    );

    Alert(context: dialogContext, style: alertStyle, title: error, buttons: [
      DialogButton(
        onPressed: () {
          Navigator.pop(dialogContext);
        },
        color: MyColors.redColor,
        child: const Text(
          "Try Again",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      )
    ]).show();
  }
}
