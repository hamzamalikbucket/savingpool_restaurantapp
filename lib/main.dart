import 'package:flutter/material.dart';
import 'package:savingpool_restaurantapp/Constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:savingpool_restaurantapp/Screens/AddOptionScreen.dart';

import 'Screens/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saving Pool Restaurant App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
        initialRoute: Constants.splash,
        builder: EasyLoading.init(),

        routes: {
          Constants.splash: (context) =>Splash(),
          Constants.AddDeal: (context) =>AddScreen(),











        }
    );
  }
}


