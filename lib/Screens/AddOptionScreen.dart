import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savingpool_restaurantapp/MyColors.dart';
import 'package:savingpool_restaurantapp/Utils.dart';
import 'package:savingpool_restaurantapp/widgets/BtnNullHeightWidth.dart';
import 'package:savingpool_restaurantapp/widgets/NameInputWidget.dart';
import 'package:savingpool_restaurantapp/widgets/Toolbar.dart';
import 'package:image_picker/image_picker.dart';



class AddScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AddState();
  }

}
class AddState extends State<AddScreen>{
  final GlobalKey<FormState> AddKey = GlobalKey<FormState>();
  late String Name, Price,Description;
  TextEditingController FromController = TextEditingController();
  File? _selectedImage;

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: ToolbarBack(appBar: AppBar(), title: 'Add',),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Utils.APP_PADDING),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                form(context),



              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget form(BuildContext context) {
    return Form(
        key: AddKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: MyColors.blue,
                    ),
                    color: MyColors.blackColor12,

                  ),
                  child: _selectedImage != null
                      ? Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover ,
                  )
                      : ImageIcon(
                    AssetImage("assets/images/cam.png",),

                    size: 32,
                  ),
                ),
                SizedBox(height: 20),
                BtnNullHeightWidth(
                  title: "Login",
                  bgcolour: MyColors.blue,
                  disablecolor: MyColors.whiteColor,
                  textcolour: MyColors.whiteColor,
                  onPress: () {
                    _getImageFromGallery();



                  },
                  width: 100,
                  height: 48,
                ),
              ],
            ),
            NameInputWidget(
                title: "Deal Name",
                error: "Enter Name",
                isRequired: true,
                icon: Icons.title,
                keyboardType: TextInputType.text,
                value: (val) {
                  Name = val!;
                },
                width: MediaQuery.of(context).size.width,
                validate: true,
                isPassword: false,
                hintcolour: MyColors.whiteColor),
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,
            NameInputWidget(
                title: "Price",
                error: "Enter Price",
                isRequired: false,
                icon: Icons.price_change_outlined,
                keyboardType: TextInputType.number,
                value: (val) {
                  Price = val!;
                },
                width: MediaQuery.of(context).size.width,
                validate: false,
                isPassword: false,
                hintcolour: MyColors.whiteColor),

            Utils.FORM_HINT_PADDING,

            Utils.FORM_HINT_PADDING,
            TextFormField(
              style: TextStyle(color: MyColors.blue),
              decoration: InputDecoration(
                  fillColor: MyColors.whiteColor,
                  filled: true,
                  contentPadding: const EdgeInsets.all(10),


                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.blue),
                  ),
                  focusedBorder:UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.blue),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.whiteColor),

                  ),

                  hintText: "Description",
                  labelText: "Description",
                  labelStyle: TextStyle(color: MyColors.blue),
                  hintStyle: TextStyle(color: MyColors.whiteColor)),
              maxLines: 5,
              obscureText: false,
              validator: (description) {
                if (description!.isEmpty) {
                  return 'Message is empty';
                }
              },
              onSaved: (value) {
                Description = value!;
              },
              onChanged: (value) {
                setState(() {});
              },
            ),


/*
          BtnNullHeightWidth(
            title: "Save",
            bgcolour: MyColors.blue,
            textcolour: MyColors.whiteColor,
            onPress: () {

              final form = AddKey.currentState;
              form!.save();
              if (form.validate()) {
                bl.display();
                if(Phone.isEmpty){
                  setState(() {
                    Phone="0";
                  });
                }
                if(OpeningDate.isEmpty){
                  setState(() {
                    DateFormat formatter = DateFormat('dd-MM-yyyy');
                    OpeningDate = formatter.format(openingdate);

                  });

                }

                try{
                  addAccount();
                }catch (e){
                  bl.close();
                  confirmationPopup(context, "An error Occurred.Try again later!");
                }





              }
            },
            width: MediaQuery.of(context).size.width,
            height: 48,
          ),*/
            Utils.FORM_HINT_PADDING,
            Utils.FORM_HINT_PADDING,

          ],
        ));
  }

}
