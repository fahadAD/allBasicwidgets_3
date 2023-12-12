import 'package:allbasicwidget3/text_To_speect.dart';
import 'package:flutter/material.dart';

import 'all_chart.dart';
import 'datatable_tabl_bottomnavBar.dart';


void main() {
  runApp(const MyApp());
}

 class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
       home: ALLFlutterChart(),
     );
   }
 }
