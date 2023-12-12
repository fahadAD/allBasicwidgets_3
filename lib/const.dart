import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

extension FormatString on Duration {
  String format() => toString().substring(2, 7);
}



class SalesModel{
late final double year;
late final double profit;
SalesModel(this.year,this.profit);
}

class RadiulBarModel{
  late final double amount;
  late final String name;
  RadiulBarModel(this.amount,this.name);
}

class DonutBarModel{
  late final double amount;
  late final String name;
  DonutBarModel(this.amount,this.name);
}

class PieChartModel{
  late final double amounts;
  late final String names;
  PieChartModel(this.amounts,this.names);
}

class AreaChartModel{
  late final double year;
  late final double amount;
  AreaChartModel(this.year,this.amount);
}

class DatagridModel{
  late final int id;
  late final String name;
  late final String degination;
  late final int salary;
  DatagridModel(this.name,this.id,this.degination,this.salary);
}




class EmployaeDatagridSource extends DataGridSource{
  EmployaeDatagridSource(List<DatagridModel> employaes){
    dataGrid_Row=employaes.map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<int>(columnName: "id", value: dataGridRow.id,),
      DataGridCell<String>(columnName: "degination", value: dataGridRow.degination,),
      DataGridCell<String>(columnName: "name", value: dataGridRow.name,),
    DataGridCell<int>(columnName: "salary", value: dataGridRow.salary,),

  ]),
  ).toList();
  }
  late List<DataGridRow>  dataGrid_Row;

@override
List<DataGridRow>get rows => dataGrid_Row;



  

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
     return DataGridRowAdapter(cells: row.getCells().map<Widget>((dataGridcell){
         return Container(
           padding: EdgeInsets.symmetric(horizontal: 16.0),
           alignment: (dataGridcell.columnName=="id" || dataGridcell.columnName== "salary")
           ? Alignment.centerRight:Alignment.centerLeft,
           child: Text(dataGridcell.value.toString(),
             overflow: TextOverflow.ellipsis,
           ),);
     }).toList());
  }
}


 




