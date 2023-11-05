import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ReceiptInfo extends StatefulWidget {
  final ScaleInfoDetail data;
  const ReceiptInfo({Key? key, required this.data}) : super(key: key);

  @override
  State<ReceiptInfo> createState() => _ReceiptInfoState();
}

class _ReceiptInfoState extends State<ReceiptInfo> {
  @override
  Widget build(BuildContext context) {
    return SfDataGrid(
      rowHeight: 70,
      source: widget.data,
      columnWidthMode: ColumnWidthMode.auto,
      isScrollbarAlwaysShown: true,
      columns: <GridColumn>[
        GridColumn(
          columnName: '#',
          minimumWidth: 10,
          columnWidthMode: ColumnWidthMode.auto,
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: const Center(
              child: Text(
                '#',
              ),
            ),
          ),
        ),
        GridColumn(
          columnWidthMode: ColumnWidthMode.auto,
          columnName: 'sign',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Төрөл',
            ),
          ),
        ),
        GridColumn(
          columnWidthMode: ColumnWidthMode.auto,
          columnName: 'vehiclePlateNo',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Авто машин',
            ),
          ),
        ),
        GridColumn(
          columnWidthMode: ColumnWidthMode.auto,
          columnName: 'vehiclePlateNo',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.center,
            child: const Text(
              'Жин',
            ),
          ),
        ),
        GridColumn(
          minimumWidth: 410,
          columnWidthMode: ColumnWidthMode.fitByCellValue,
          columnName: 'trailerInfo',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Чиргүүл, чингэлэг',
            ),
          ),
        ),
        GridColumn(
          columnWidthMode: ColumnWidthMode.fill,
          columnName: 'driver',
          label: Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Жолооч',
            ),
          ),
        ),
      ],
    );
  }
}

class ScaleInfoDetail extends DataGridSource {
  ScaleInfoDetail({
    required Result result,
    counter = 1,
  }) {
    _info = result.rows!
        .map(
          (e) => DataGridRow(
            cells: [
              DataGridCell(columnName: '#', value: "${counter++}."),
              DataGridCell(columnName: 'sign', value: e.type),
              DataGridCell(
                  columnName: 'vehiclePlateNo', value: e.vehiclePlateNo),
              DataGridCell(columnName: 'weightValue', value: e.weightValue),
              DataGridCell(
                  columnName: 'trailerPlateNumbers',
                  value: e.trailerPlateNumbers),
              DataGridCell(
                  columnName: 'containerNumbers', value: e.containerNumbers),
              DataGridCell(columnName: 'driver', value: e.driverName),
              DataGridCell(columnName: 'driver', value: e.driverRegisterNo),
              DataGridCell(columnName: 'driver', value: e.driverPhone),
              DataGridCell(columnName: 'driver', value: e.driverPhoneSecond),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _info = [];

  @override
  List<DataGridRow> get rows => _info;
  int get rowCount => 50;

  get counter => null;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    var trailers = row.getCells()[4].value as List<String>;
    var contianers = row.getCells()[5].value as List<String>;
    // contianers.join(", "),
    return DataGridRowAdapter(
      cells: <Widget>[
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Center(child: Text(row.getCells()[0].value.toString())),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Center(child: Text(row.getCells()[1].value.toString())),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Center(
            child: Text(
              row.getCells()[2].value.toString(),
              style: TextStyle(
                color: black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Center(child: Text(row.getCells()[3].value.toString())),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: gray102,
                      ),
                    ),
                    child: Text(
                      trailers.join(", "),
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        contianers.join(", "),
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: gray102,
                      ),
                    ),
                    child: Text(
                      row.getCells()[6].value.toString(),
                      style: TextStyle(
                        color: black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${row.getCells()[7].value.toString()}, ${row.getCells()[8].value.toString()},",
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
