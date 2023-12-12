import 'package:flutter/material.dart';
class ColorGradientScreen extends StatefulWidget {
  const ColorGradientScreen({super.key});

  @override
  State<ColorGradientScreen> createState() => _ColorGradientScreenState();
}

class _ColorGradientScreenState extends State<ColorGradientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topLeft,
              colors: [
             Colors.teal,
             Colors.red,

          ])
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
        
        Center(
          child: Container(
            height: 300,
            width: 500,
            decoration: BoxDecoration(

        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            tileMode: TileMode.mirror,
            colors: [
          Colors.yellow,
          Colors.green,
          Colors.blue,
          Colors.red,
        ]),
            ),
          ),
        ),
        SizedBox(height: 60,),
            Center(
              child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  gradient: RadialGradient(

                      tileMode: TileMode.mirror,
                      colors: [
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.red,
                  ]),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Center(
              child: Container(
                height: 300,
                width: 500,
                decoration: BoxDecoration(
                  gradient: SweepGradient(

                      tileMode: TileMode.clamp,
                      colors: [
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.red,
                  ]),
                ),
              ),
            ),
            SizedBox(height: 60,),
          ],
        ),
      ),
    );
  }
}