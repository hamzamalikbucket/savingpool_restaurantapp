
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:savingpool_restaurantapp/Screens/DealsScreen.dart';
import 'package:savingpool_restaurantapp/widgets/TextWidget.dart';




import '../MyColors.dart';
import 'LoginScreen.dart';




class NavigationScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomBarState()  ;
  }

}
class BottomBarState extends State<NavigationScreen> {

  int sum = 0;
  bool login=false;
  int _selectedIndex = 0;
  final List<Widget> _children = [
    DealsScreen(),
    Login(),
    Login(),




  ];
  Widget _intInitialWidget = DealsScreen();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _intInitialWidget,
      bottomNavigationBar:

      BottomNavyBar(
        containerHeight: 55.00,
        selectedIndex: _selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected:_onItemTapped,

        itemCornerRadius: 24,
        curve: Curves.easeIn,
        backgroundColor: MyColors.whiteColor,
        items:[
          BottomNavyBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/reward.png",),

                size: 32,
              ),
              title:TextWidget(input: "Deals", fontsize:14, fontWeight: FontWeight.w700, textcolor:MyColors.blue),


              activeColor: MyColors.darkblueColor,
              inactiveColor: MyColors.gray

          ),
    /*      BottomNavyBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/reward.png"),
                size: 22,
              ),
              title:TextWidget(input: "Rewards", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.blue),
              activeColor: MyColors.darkblueColor,
              inactiveColor: MyColors.gray,
          ),
          BottomNavyBarItem(
              icon: const ImageIcon(
                AssetImage("assets/images/delivery.png"),
                size: 22,
              ),
              title:TextWidget(input: "Delivery", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.blue),
              activeColor: MyColors.darkblueColor,
              inactiveColor: MyColors.gray,
          ),*/
          BottomNavyBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/scan.png",),
              size: 22,


            ),

    activeColor: MyColors.darkblueColor,
    inactiveColor: MyColors.gray,
            title:TextWidget(input: "Scan", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.blue),


          ),
          BottomNavyBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/more.png",),
              size: 22,


            ),

    activeColor: MyColors.darkblueColor,
    inactiveColor: MyColors.gray,
            title:TextWidget(input: "More", fontsize:12, fontWeight: FontWeight.w700, textcolor:MyColors.blue),


          ),
        ],



      ),
    );
  }
  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
      switch(index){
        case 0:
          _intInitialWidget = _children[0];
          break;
        case 1:
          _intInitialWidget = _children[1];

          break;

        case 2:
          _intInitialWidget = _children[2];

          break;




      }
    });
  }


}