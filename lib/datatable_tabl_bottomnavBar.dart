import 'package:flutter/material.dart';
 class DataTable_Table_BottomNavScreen extends StatefulWidget {
  const DataTable_Table_BottomNavScreen({super.key});

  @override
  State<DataTable_Table_BottomNavScreen> createState() => _DataTable_Table_BottomNavScreenState();
}

class _DataTable_Table_BottomNavScreenState extends State<DataTable_Table_BottomNavScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        floatingActionButton: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle
          ),
          child: Icon(Icons.add,color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
bottomNavigationBar: BottomAppBar(
notchMargin: 5.0,
  shape: CircularNotchedRectangle(),
  color: Colors.black,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    mainAxisSize: MainAxisSize.max,
    children: [
       Column(
         mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.home_work_outlined,color: Colors.white),
        Text("Home",style: TextStyle(color: Colors.white)),
      ],
    ),
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite,color: Colors.white),
            Text("Fav",style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.line_weight_sharp,color: Colors.white),
            Text("List",style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person,color: Colors.white),
          Text("Person",style: TextStyle(color: Colors.white)),
        ],
      ),
    ],
  ),
),
        body: SingleChildScrollView(
          child: Column(
            children: [

              DataTable(
                clipBehavior: Clip.none,
                  columns: [
                     DataColumn(label: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),)),
                     DataColumn(label: Text("Adress",style: TextStyle(fontWeight: FontWeight.bold),)),
                     DataColumn(label: Text("Phone",style: TextStyle(fontWeight: FontWeight.bold),)),
                   ],
                  rows: [
                  DataRow(
                      selected: true,
                      cells: [
                DataCell(Text("Fahad")),
                DataCell(Text("Dhaka")),
                DataCell(Text("+885567684")),
                   ]),
                    DataRow(
                        selected: true,
                        cells: [
                      DataCell(Text("Sami")),
                      DataCell(Text("CTG")),
                      DataCell(Text("+8855666684")),
                     ]),
                    DataRow(

                        selected: true,
                        cells: [
                      DataCell(Text("Fahad")),
                      DataCell(Text("Dhaka")),
                      DataCell(Text("+885567684")),
                     ]),
                   ]),

SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Table(
                  textDirection: TextDirection.rtl,
                   border: TableBorder.all(  borderRadius: BorderRadius.all(Radius.circular(10),),color: Colors.black ,width: 2),
                  children: const [
                  TableRow(
                    children: [
                      Text("Name",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text("ID",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                      Text("Country Code",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    ]
                  ),
                  TableRow(
                    children: [
                      Text("fahad",),
                      Text("988675",),
                      Text("+88",),                  ]
                  ),
                  TableRow(
                      children: [
                        Text("Sami",),
                        Text("6676879",),
                        Text("+32",),                  ]
                  ),
                  TableRow(
                      children: [
                        Text("ammu",),
                        Text("687985",),
                        Text("+45",),                  ]
                  ),
                ],),
              ),
              SizedBox(height: 20,),



            ],
          ),
        ),
      ),
    );
  }
}
