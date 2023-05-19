import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savingpool_restaurantapp/Constants.dart';
import 'package:savingpool_restaurantapp/Models/DealsModel.dart';
import 'package:savingpool_restaurantapp/MyColors.dart';
import 'package:savingpool_restaurantapp/Utils.dart';
import 'package:savingpool_restaurantapp/widgets/BtnNullHeightWidth.dart';
import 'package:savingpool_restaurantapp/widgets/TextWidget.dart';
import 'package:savingpool_restaurantapp/widgets/Toolbar.dart';

class DealsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DealsState();
  }

}

class DealsState extends State<DealsScreen>{
  List<DealsModel> rModel=[
    DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","1","120",true),
    DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",false),

    DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",true),

    DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","3","120",true),
    DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",false),

    DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","3","120",true),

  ];
  bool daily=true;
  DealsModel? _selectedProduct;
  bool yearly=false;
  bool menu=false;
  String qrURL="";
  bool isredeem=true;
  bool _showPopup = false;
  double _popupHeight = 0;
  @override
  void initState() {
    // TODO: implement initState

setState(() {
  rModel=[
    DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","1","120",true),
    DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",false),

    DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",true),

    DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","3","120",true),
    DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",false),

    DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","3","120",true),

  ];

});
  }


  void _showProductPopup(DealsModel product) {
    setState(() {
      _showPopup = true;
      _selectedProduct = product;
      _popupHeight = MediaQuery.of(context).size.height * 0.8;

    });
    showDialog(
      context: context,
      builder: (context){
        return GestureDetector(
          onVerticalDragUpdate: _handleDrag,
          onVerticalDragEnd: _handleDragEnd,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: AlertDialog(
              title: Center(child:  TextWidget(
                  input:_selectedProduct!.dealName,
                  fontsize: 18,
                  fontWeight: FontWeight.w700,
                  textcolor: MyColors.blue),),
              content: _selectedProduct!=null?
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: _popupHeight,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset(
                            _selectedProduct!.dealImg,
                            height: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                            input:_selectedProduct!.dealDetail,
                            fontsize: 14,
                            fontWeight: FontWeight.w700,
                            textcolor: MyColors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                            input:"Quantity:${_selectedProduct!.dealQty}",
                            fontsize: 14,
                            fontWeight: FontWeight.w700,
                            textcolor: MyColors.blue),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                            input:"Price:"+_selectedProduct!.dealPrice,
                            fontsize: 14,
                            fontWeight: FontWeight.w700,
                            textcolor: MyColors.blue),
                      ),
                      Utils.FORM_HINT_PADDING,
                      Utils.FORM_HINT_PADDING,
                      Utils.FORM_HINT_PADDING,
                      (menu||yearly)?
                      SizedBox():BtnNullHeightWidth(
                       title: (_selectedProduct!.isActive)?  "Deactivate":"Activate",
                        bgcolour: MyColors.blue,
                        disablecolor: MyColors.yellowColor,
                        textcolour: MyColors.whiteColor,
                        onPress: () {
                          setState(() {
                            _selectedProduct!.isActive=!_selectedProduct!.isActive;
                          });
                          Navigator.pop(context);



                        },
                        width: MediaQuery.of(context).size.width,
                        height: 48,
                      ),

                    ],
                  ),
                ),
              ):TextWidget(
                  input:"cnt show",
                  fontsize: 18,
                  fontWeight: FontWeight.w700,
                  textcolor: MyColors.blue),

            ),
          ),
        );},
    );

  }

  void _handleDrag(DragUpdateDetails details) {
    setState(() {
      _popupHeight -= details.delta.dy;
      if (_popupHeight < 0) {
        _popupHeight = 0;

      }
    });
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_popupHeight < MediaQuery.of(context).size.height * 0.5) {
      setState(() {
        Navigator.pop(context);
        _popupHeight = 0;
        _selectedProduct = null;

      });
    } else {
      setState(() {
        _popupHeight = MediaQuery.of(context).size.height * 0.8;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      appBar: ToolbarBack(appBar: AppBar(), title: "Deals",),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png',height: 250,fit: BoxFit.fitWidth,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BtnNullHeightWidth(
                      title: "Daily Deals",
                      bgcolour: (daily)?MyColors.blue:MyColors.whiteColor,
                      disablecolor: MyColors.yellowColor,
                      textcolour: (daily)?MyColors.whiteColor:MyColors.black,
                      onPress: () {
                        setState(() {
                          daily=true;
                          yearly=false;
                          menu=false;

                          rModel.clear();





                        });


                      },
                      width: 125,
                      height: 48,
                    ),
                    BtnNullHeightWidth(
                      title: "Yearly Deals",
                      bgcolour: (yearly)?MyColors.blue:MyColors.whiteColor,
                      disablecolor: MyColors.yellowColor,
                      textcolour: (yearly)?MyColors.whiteColor:MyColors.black,
                      onPress: () {
                        setState(() {
                          daily=false;
                          yearly=true;
                          menu=false;

                          rModel.clear();
                          rModel=[

                            DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","1","120",true),
                            DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",false),


                          ];


                        });



                      },
                      width: 130,
                      height: 48,
                    ),
                    BtnNullHeightWidth(
                      title: "Menu",
                      bgcolour: (menu)?MyColors.blue:MyColors.whiteColor,
                      disablecolor: MyColors.yellowColor,
                      textcolour: (menu)?MyColors.whiteColor:MyColors.black,
                      onPress: () {
                        setState(() {
                          daily=false;
                          yearly=false;
                          menu=true;
                          rModel.clear();
                          rModel=[

                            DealsModel("assets/images/bgg.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Burgers","1","120",true),
                            DealsModel("assets/images/burgerdeal.png", "lorem ipsum detai is coming from backend of product this product is use for mutiple xyxz you can redeem this deal using your qr etx asadsadsad", "5", "Free Zinger","2","120",false),

                          ];
                        });


                      },
                      width: 80,
                      height: 48,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: rModel.length,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DealsModel dealModel=rModel[index];

                    return GestureDetector(
                      onTap: (){
                        _showProductPopup(dealModel);

                      },
                      child: Opacity(
                        opacity:(dealModel.isActive)?1.0:0.5,
                        child: Card(
                          color: MyColors.whiteColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: MyColors.blackColor24, width: 1.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(

                                  dealModel.dealImg,
                                  height: 135,

                                  fit: BoxFit.contain,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextWidget(
                                    input:dealModel.dealName,
                                    fontsize: 17,
                                    fontWeight: FontWeight.w800,
                                    textcolor: MyColors.blue),
                              ),



                            ],
                          ),
                        ),
                      ),
                    );
                  },   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),),
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(

          onPressed: () async {
            await Navigator.pushNamed(context, Constants.AddDeal);
            setState(() {
              rModel.clear();

              initState();
            });
          },

        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),

    );
  }
}

/*
           SliverGrid(

                 gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                   maxCrossAxisExtent: 250.0,
                   mainAxisExtent: 260,
                   childAspectRatio: 0.6),
             delegate: SliverChildBuilderDelegate(
               childCount: rModel.length,
             (BuildContext context, int index) {
               RestaurantModel restModel=rModel[index];
               return Card(
                 color: MyColors.whiteColor,
                 elevation: 30,
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),
                     side: BorderSide(color: MyColors.blackColor24, width: 1.0)),
                 child: Column(
                   mainAxisSize: MainAxisSize.min,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Image.asset(
                         restModel.image!,
                       ),
                     ),
                     Divider(
                       thickness: 1,
                       color: MyColors.blackColor48,
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: TextWidget(
                           input:restModel.restaurantName!,
                           fontsize: 18,
                           fontWeight: FontWeight.w900,
                           textcolor: MyColors.blue),
                     ),



                   ],
                 ),
               );
             }),

               )*/