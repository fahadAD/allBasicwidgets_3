import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ImagePick_botttomsheet_dropDownButton_DismisableScreen extends StatefulWidget {
  const ImagePick_botttomsheet_dropDownButton_DismisableScreen({super.key});

  @override
  State<ImagePick_botttomsheet_dropDownButton_DismisableScreen> createState() => _ImagePick_botttomsheet_dropDownButton_DismisableScreenState();
}

class _ImagePick_botttomsheet_dropDownButton_DismisableScreenState extends State<ImagePick_botttomsheet_dropDownButton_DismisableScreen> {

  bool _switch=false;

  bool check=true;
 var selecteD="";

  File? _selected_fileImage;
  Future _PickimageCamers({required ImageSource sourse})async{
    final return_images= await ImagePicker().pickImage(source: sourse);

  if(return_images?.path != null){
    setState(() {
      _selected_fileImage=File(return_images!.path);
    });
  }
  }
  
  Future _PickimageGallery({required ImageSource sourse})async{
    final return_images= await ImagePicker().pickImage(source: sourse);

  if(return_images?.path != null){
    setState(() {
      _selected_fileImage=File(return_images!.path);
    });
  }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image pick")),
      body: SingleChildScrollView(
        child: Column(
          children: [

                // Image picker

            _selected_fileImage!=null?
            Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(image: FileImage(_selected_fileImage!),fit: BoxFit.fitWidth)
          ),
        )
                :
            Container(
              color: Colors.blueGrey,
                height: 300,
               width: double.infinity,
               child: Center(child: Text("Please Select Image",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
            ),



            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ElevatedButton(onPressed: () {

        _PickimageCamers(sourse: ImageSource.camera);

              }, child: Icon(Icons.camera_alt)),
              ElevatedButton(onPressed: () {

            _PickimageGallery(sourse: ImageSource.gallery);

              }, child: Icon(Icons.image)),
            ],),


            SizedBox(height: 40,),
              //model bottom sheet
            ElevatedButton(onPressed: () {
              showModalBottomSheet(context: context, builder: (context) {
                return Container(

                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                  )),
                );
              },);
            }, child: Text("Model bottom sheet")),
            SizedBox(height: 40,),
                    // DropdownButton
Text(selecteD),
            DropdownButton(
              hint: Text("Select"),
              items: [
DropdownMenuItem( value: "Fahad",child: Text("Fahad")),
DropdownMenuItem( value: "Sami",child: Text("Sami")),

            ], onChanged: (value) {
              setState(() {
                selecteD=value!;
              });
            },),
            SizedBox(height: 40,),
                    //Dismissible
Dismissible(

    key: ValueKey("value"),
    background: Container(color: Colors.black,child: Icon(Icons.delete,color: Colors.white),),
    secondaryBackground: Container(color: Colors.blue,child: Icon(Icons.send,color: Colors.white),),
    child: ListTile(
      leading: Icon(Icons.person),
      title: Text("Fahad"),
      subtitle: Text("Develover"),
      trailing: Icon(Icons.call),
    )
),
            SizedBox(height: 40,),
              //AnimatedCrossFade
           Container(
             color: Colors.blue,
             width: double.infinity,
             height: 200,
             child: Center(
               child: AnimatedCrossFade(

                   firstChild: ElevatedButton(onPressed: () {
                        setState(() {
                          check=false;
                        });
                   }, child: Text("Press")),
                   secondChild: Text("Fahad",style: TextStyle(fontSize: 50)),
                   crossFadeState:  check?CrossFadeState.showFirst:CrossFadeState.showSecond,
                   duration: Duration(seconds: 1)),
             ),
           ),


            CupertinoSwitch(value: _switch, onChanged: (value) {
                setState(() {
                  _switch=!_switch;
                });
            },)


          ],
        ),
      ),
    );
  }
}
