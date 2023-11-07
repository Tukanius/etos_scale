// import 'package:after_layout/after_layout.dart';
import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> with AfterLayoutMixin {
  TruckTable tableRow = TruckTable(result: Result(rows: [], count: 0));
  int page = 1;
  int limit = 30;
  bool isLoading = false;
  loadData(int page, int limit) async {
    Filter filter = Filter();
    Offset offset = Offset(limit: limit, page: page);

    // Result res = await ReceiptApi()
    //     .list(ResultArguments(filter: filter, offset: offset));
    // setState(() => tableRow = TruckTable(result: res));
  }

  @override
  afterFirstLayout(BuildContext context) {
    setState(() {
      isLoading = false;
    });
    loadData(page, limit);
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gray101,
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              child: isLoading == true
                  ? SfDataGrid(
                      rowHeight: 70,
                      source: tableRow,
                      columnWidthMode: ColumnWidthMode.lastColumnFill,
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
                          minimumWidth: 100,
                          columnName: 'sign',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Үйлдэл',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 270,
                          columnWidthMode: ColumnWidthMode.auto,
                          columnName: 'vehiclePlateNo',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Авто машин',
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
                          minimumWidth: 330,
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
                        GridColumn(
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          columnName: 'receiptNo',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Баримт',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 150,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'supplierName',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Худалдаалагч',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 150,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'transportName',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Тээвэрлэгч',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 130,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'contractNo',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Гэрээний дугаар',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 150,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'buyerName',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Худалдан авагч',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 120,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'routeName',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Чиглэл',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 150,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'productName',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Нүүрсний төрөл',
                            ),
                          ),
                        ),
                        GridColumn(
                          minimumWidth: 100,
                          columnWidthMode: ColumnWidthMode.fill,
                          columnName: 'createdAt',
                          label: Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Огноо',
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: colorBlue,
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}

class TruckTable extends DataGridSource {
  TruckTable({
    required Result result,
    counter = 1,
  }) {
    _info = result.rows!
        .map(
          (e) => DataGridRow(
            cells: [
              DataGridCell(columnName: '#', value: counter++),
              const DataGridCell(columnName: 'sign', value: 1),
              DataGridCell(
                  columnName: 'vehiclePlateNo', value: e.vehiclePlateNo),
              DataGridCell(columnName: 'fullWeight', value: e.fullWeight),
              DataGridCell(columnName: 'unladedWeight', value: e.unladedWeight),
              DataGridCell(columnName: 'totalWeight', value: e.totalWeight),
              DataGridCell(
                  columnName: 'trailerPlateNumbers',
                  value: e.trailerPlateNumbers),
              DataGridCell(
                  columnName: 'containerNumbers', value: e.containerNumbers),
              DataGridCell(columnName: 'driver', value: e.driverPdlNumber),
              DataGridCell(columnName: 'driver', value: e.driverName),
              DataGridCell(columnName: 'driver', value: e.driverRegisterNo),
              DataGridCell(columnName: 'driver', value: e.driverPhone),
              DataGridCell(columnName: 'receiptNo', value: e.receiptNo),
              DataGridCell(columnName: 'supplierName', value: e.supplierName),
              DataGridCell(columnName: 'transportName', value: e.transportName),
              DataGridCell(columnName: 'contractNo', value: e.contractNo),
              DataGridCell(columnName: 'buyerName', value: e.buyerName),
              DataGridCell(columnName: 'routeName', value: e.buyerName),
              DataGridCell(columnName: 'productName', value: e.productName),
              DataGridCell(columnName: 'createdAt', value: e.createdAt),
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
    var trailers = row.getCells()[6].value as List<String>;
    var contianers = row.getCells()[7].value as List<String>;
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
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: gray102,
                    ),
                    child: SvgPicture.asset('assets/svg/edit.svg'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: gray102,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: SvgPicture.asset('assets/svg/delete.svg'),
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
                  row.getCells()[2].value.toString(),
                  style: TextStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
                      SvgPicture.asset(
                        'assets/svg/circlefill.svg',
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        row.getCells()[3].value.toString(),
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/circle.svg',
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        row.getCells()[4].value.toString(),
                        style: TextStyle(
                          color: black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset(
                        'assets/svg/square.svg',
                        height: 15,
                        width: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        row.getCells()[5].value.toString(),
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
                      row.getCells()[8].value.toString(),
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
                      SvgPicture.asset(
                        'assets/svg/idcard.svg',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${row.getCells()[9].value.toString()}, ${row.getCells()[10].value.toString()}, ${row.getCells()[11].value.toString()},",
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
          child: Text(row.getCells()[12].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[13].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[14].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[15].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[16].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[17].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[18].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat("yyyy-MM-dd")
                .format(DateTime.parse(row.getCells()[19].value.toString())),
          ),
        ),
      ],
    );
  }
}
