import 'package:allbasicwidget3/const.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ALLFlutterChart extends StatefulWidget {
  const ALLFlutterChart({super.key});

  @override
  State<ALLFlutterChart> createState() => _ALLFlutterChartState();
}

class _ALLFlutterChartState extends State<ALLFlutterChart> {

  TooltipBehavior _tooltipBehavior=TooltipBehavior(enable: true);



  List<SalesModel> getLineChartData=[
    SalesModel(2015, 5),
    SalesModel(2017, 8),
    SalesModel(2019, 12),
    SalesModel(2021, 4),
    SalesModel(2023, 10),
  ];
List<RadiulBarModel> getRadialBarChartData=[
  RadiulBarModel(333337000, "Fahad"),
  RadiulBarModel(2003330, "Sami"),
  RadiulBarModel(83333000, "sadh"),
  RadiulBarModel(20554400, "Shahariar"),
  RadiulBarModel(76099999, "Fahim"),
  RadiulBarModel(100000, "Rakib"),
];

  List<DonutBarModel> getDonutBarChartData=[
    DonutBarModel(599, "A+"),
    DonutBarModel(544, "A-"),
    DonutBarModel(999, "D"),
    DonutBarModel(2222, "C"),
  ];
  List<PieChartModel> getPieChartData=[
    PieChartModel(919, "January"),
    PieChartModel(344, "February"),
    PieChartModel(939, "December"),
    PieChartModel(2922, "October"),
  ];
  List<AreaChartModel> getAreaChartData=[
    AreaChartModel(2017,25),
    AreaChartModel(2018, 12),
    AreaChartModel(2020,  17),
    AreaChartModel(2023, 78),

  ];

  late List<DatagridModel>  _employaeses;
  late EmployaeDatagridSource _employaeDatagrid_Source;
  List<DatagridModel> getDatagrid_Datas(){
    return [
      DatagridModel("Fahad", 6619, "Project Lead", 1000),
      DatagridModel("Sami", 4578, "Developer", 3000),
      DatagridModel("Sadh", 9086, "Lead Engineers", 6000),
      DatagridModel("Fahim", 3577, "Leader", 1000),
      DatagridModel("Shahariar", 2444, "Project Manager", 9000),
      DatagridModel("Rakib", 7444, "Project Asisten", 7700),
      DatagridModel("Akib", 9856, "Project helper", 56646),
    ];
  }
@override
  void initState() {
    super.initState();
    getLineChartData;
    getRadialBarChartData;
    getDonutBarChartData;
    getPieChartData;
    getAreaChartData;
     _employaeses=getDatagrid_Datas();
    _employaeDatagrid_Source=EmployaeDatagridSource(_employaeses);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(title: Text("ALLFlutterChart")),
      body: SingleChildScrollView(
        child: Column(
          children: [

SizedBox(height: 10,),

        Container(
         color: Colors.white,
           width: double.infinity,
 child: SfCartesianChart(
   tooltipBehavior: _tooltipBehavior,
   title: ChartTitle(text:  "Yearly Sales analysis of Line Chart"),
   // legend: Legend(isVisible: true),

   series: <ChartSeries>[
     LineSeries<SalesModel, double>(
       // name: "Sales",
       dataSource: getLineChartData,
         xValueMapper:  (SalesModel sales, index) => sales.year,
         yValueMapper:  (SalesModel sale, index) => sale.profit,
       dataLabelSettings: DataLabelSettings(isVisible: true),
       enableTooltip: true
     ),
   ],

   primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
   primaryYAxis: NumericAxis(
     numberFormat:  NumberFormat.simpleCurrency(decimalDigits: 2),
       labelFormat: "{value}B"
   ),
 ),
        ),
            SizedBox(height: 20,),

            Container(
              height: 500,
              color: Colors.white,
              width: double.infinity,
              child:  SfCartesianChart(
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                title: ChartTitle(text:  "Yearly Sales analysis of Area Chart"),
                series:  <ChartSeries>[
                  AreaSeries<AreaChartModel , double>(
                      name: "Sales",
                      dataSource: getAreaChartData,
                      xValueMapper: (AreaChartModel year, index) => year.year,
                      yValueMapper: (AreaChartModel amount, index) => amount.amount,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true
                  )
                ],
                primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: NumericAxis(
                    numberFormat:  NumberFormat.simpleCurrency(decimalDigits: 1),
                    labelFormat: "{value}M"
                ),

              ),
            ),
            SizedBox(height: 10,),
Container(
  width: double.infinity,
  child: SfCircularChart(
    tooltipBehavior: _tooltipBehavior,

    title: ChartTitle(text:  "Yearly Sales analysis of Radial Bar Chart",),
    legend: Legend(isVisible: true),
    palette: [Colors.red,Colors.white,Colors.yellow,Colors.orange,Colors.blueAccent,Colors.purpleAccent],

  series: [
    RadialBarSeries<RadiulBarModel, String>(
       enableTooltip: true,
      radius: "90",
      innerRadius: "40",
      trackColor: Colors.white70,
      gap: "5%",
      // cornerStyle: CornerStyle.bothCurve,
      dataSource: getRadialBarChartData,
        xValueMapper: (RadiulBarModel salesData, index) => salesData.name,
        yValueMapper: (RadiulBarModel salesData, index) => salesData.amount,
      dataLabelSettings: DataLabelSettings(isVisible: true),
    )
  ],

   ),

),
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: SfCircularChart(
                backgroundColor: Colors.black,
                tooltipBehavior: _tooltipBehavior,
                title: ChartTitle(text:  "Yearly Sales analysis of Donut Bar Chart",textStyle: TextStyle(color: Colors.white)),
                legend: Legend(isVisible: true),
                palette: [Colors.red,Colors.white,Colors.yellow,Colors.orange,],

                series: [
             DoughnutSeries<DonutBarModel,String>(
               enableTooltip: true,
               // radius: "90",
               // innerRadius: "40",
               // cornerStyle: CornerStyle.bothFlat,
               explode: true,
               strokeWidth: 2,
               strokeColor: Colors.tealAccent,
               dataSource: getDonutBarChartData,
                 xValueMapper: (DonutBarModel donator, index) => donator.name,
                 yValueMapper: (DonutBarModel donatesamount, index) => donatesamount.amount,
               dataLabelSettings: DataLabelSettings(isVisible: true),

             )
                ],

              ),

            ),

            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              child: SfCircularChart(
                tooltipBehavior: _tooltipBehavior,
                title: ChartTitle(text:  "Yearly Sales analysis of Pie Chart",),
                legend: Legend(isVisible: true),
                palette: [Colors.orange,Colors.blueAccent,Colors.purpleAccent,Colors.white],

                series: [
                  PieSeries<PieChartModel, String>(
                    enableTooltip: true,
                    radius: "90",
                    explode: true,
                    strokeWidth: 2,
                    strokeColor: Colors.black,

                    dataSource: getPieChartData,
                    xValueMapper: (PieChartModel salesData, index) => salesData.names,
                    yValueMapper: (PieChartModel salesData, index) => salesData.amounts,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  )
                ],

              ),

            ),

            SizedBox(height: 20,),
            Container(

              child:  SfRadialGauge(
                 backgroundColor: Colors.white70,
               title: GaugeTitle(text: " Radial Gauge ") ,
                 enableLoadingAnimation: true,
                 axes: <RadialAxis>[
               RadialAxis(
                 minimum: 0,
                 maximum: 120,
                 interval: 5,
                 ranges: <GaugeRange>[
                   GaugeRange(
                     startValue: 0,
                     endValue: 50,
                     color: Colors.orange,
                   ),
                   GaugeRange(
                     startValue: 50,
                     endValue: 90,
                     color: Colors.teal,
                   ),
                   GaugeRange(
                     startValue: 90,
                     endValue: 120,
                     color: Colors.black,
                   ),
                   GaugeRange(
                     startValue: 0,
                     endValue: 30,
                     color: Colors.red,
                   )
                 ],
                 pointers: <GaugePointer>[
                   NeedlePointer(
                    animationType:  AnimationType.easeOutBack,
                     needleColor: Colors.blue,
                      value: 70,
                     enableAnimation: true,
                   ),
                   NeedlePointer(
                     needleColor: Colors.lightGreen,
                     value: 20,
                     enableAnimation: true,
                   ),
                 ],
                 annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text("90.0",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    positionFactor: 0.3,
                      angle: 90,
                    ),

                 ],
               ),
                ],
              ),
            ),
            SizedBox(height: 20,),
Container(
width: double.infinity,
color: Colors.white,
  child: SfDataGrid(
    selectionMode: SelectionMode.multiple,
      allowSorting: true,
      source: _employaeDatagrid_Source,

      columns: [
        GridColumn(columnName: "id", label: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerRight,
          child: Text("ID",overflow: TextOverflow.ellipsis),)),


        GridColumn(columnName: "degination", label: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text("Degination",overflow: TextOverflow.ellipsis),)),


        GridColumn(columnName: "name", label: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Text("Name",overflow: TextOverflow.ellipsis),)),


        GridColumn(columnName: "salary", label: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerRight,
          child: Text("Salary",overflow: TextOverflow.ellipsis),)),
      ]),
),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

}
