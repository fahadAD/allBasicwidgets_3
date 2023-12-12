import 'package:flutter/material.dart';
class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        scrollDirection: Axis.vertical,
          children: [
          Container(color: Colors.blue,child: Center(child: Text("Page1",style: TextStyle(color: Colors.white),))),
          Container(color: Colors.deepPurpleAccent,child: Center(child: Text("Page2",style: TextStyle(color: Colors.white),))),
          Container(color: Colors.blueGrey,child: Center(child: Text("Page3",style: TextStyle(color: Colors.white),))),
        ],
      ),
    );
  }
}
