import 'package:allbasicwidget3/colorgradientwidhet.dart';
import 'package:flutter/material.dart';
class Hero_and_silverappbarScreen extends StatefulWidget {
  const Hero_and_silverappbarScreen({super.key});

  @override
  State<Hero_and_silverappbarScreen> createState() => _Hero_and_silverappbarScreenState();
}

class _Hero_and_silverappbarScreenState extends State<Hero_and_silverappbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: CustomScrollView(
     slivers: [
       SliverAppBar(
         backgroundColor: Colors.deepOrange,
         foregroundColor: Colors.yellow,
         actions: [
           ElevatedButton(onPressed: () {}, child: Text("dffffff")),
           ElevatedButton(onPressed: () {}, child: Text("ffffffff")),
         ],
         title: Text("Fahad 1"),


         expandedHeight: 400,
pinned: true,
flexibleSpace: FlexibleSpaceBar(
  background: Container(color: Colors.teal),
  title: Text("Fahim 1"),
),
       ),
SliverList(delegate: SliverChildListDelegate([
  Center(
    child: CircleAvatar(
      radius: 40,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Hero_and_silverappbarScreen(),));
        },
        child: Hero(tag: "fahad",
            child: Icon(Icons.cabin)),
      ),
    ),
  ),

]))
     ],
   ),
    );
  }
}
// Center(
// child: CircleAvatar(
// radius: 40,
// child: GestureDetector(
// onTap: () {
// Navigator.push(context, MaterialPageRoute(builder: (context) => SilverScreen(),));
// },
// child: Hero(tag: "fahad",
// child: Icon(Icons.cabin)),
// ),
// ),
// )