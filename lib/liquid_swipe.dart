import 'package:allbasicwidget3/pageviewScreen.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
class LiquidSWipeScreen extends StatefulWidget {
  const LiquidSWipeScreen({super.key});

  @override
  State<LiquidSWipeScreen> createState() => _LiquidSWipeScreenState();
}

class _LiquidSWipeScreenState extends State<LiquidSWipeScreen> {
  final pages=[
    PageViewScreen(),
   Container(color: Colors.red,child: Center(child: Text("Page1",style: TextStyle(color: Colors.white),))) ,
    Container(color: Colors.yellow,child: Center(child: Text("Page2",style: TextStyle(color: Colors.white),))) ,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidSwipe(
          pages: pages),
    );
  }
}
