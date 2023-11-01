import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/api/trcuk_api.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScaleListPage extends StatefulWidget {
  const ScaleListPage({Key? key}) : super(key: key);

  @override
  State<ScaleListPage> createState() => _ScaleListPageState();
}

class _ScaleListPageState extends State<ScaleListPage> with AfterLayoutMixin {
  TableRow tableRow = TableRow(result: Result(rows: [], count: 0));

  int page = 1;
  int limit = 30;

  loadData(int page, int limit) async {
    Filter filter = Filter();

    Offset offset = Offset(limit: limit, page: page);

    Result res = await TruckApi()
        .scaleList(ResultArguments(filter: filter, offset: offset));

    setState(() => tableRow = TableRow(result: res));
  }

  @override
  afterFirstLayout(BuildContext context) {
    loadData(page, limit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: PaginatedDataTable(
                dragStartBehavior: DragStartBehavior.start,
                availableRowsPerPage: const [30, 50, 100],
                header: const Text("Хэмжилтийн түүх"),
                dataRowMaxHeight: 140,
                onRowsPerPageChanged: (perPage) {
                  setState(() {
                    page = 1;
                    limit = perPage!;
                  });

                  loadData(1, perPage!);
                },
                onPageChanged: (value) {
                  setState(() {
                    page = value;
                  });

                  loadData(value, limit);
                },
                rowsPerPage: limit,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('#'),
                  ),
                  DataColumn(
                    label: Text('Машин'),
                  ),
                  DataColumn(
                    label: Text('Чиргүүл Ба Чингэлэг'),
                  ),
                  DataColumn(
                    label: Text('Жолооч'),
                  ),
                  DataColumn(
                    label: Text('Баримтны дугаар'),
                  ),
                  DataColumn(
                    label: Text('Худалдаалагч'),
                  ),
                  DataColumn(
                    label: Text('Тээвэрлэгч'),
                  ),
                  DataColumn(
                    label: Text('Гэрээний дугаар'),
                  ),
                  DataColumn(
                    label: Text('Худалдан авагч'),
                  ),
                  DataColumn(
                    label: Text('Чиллэл'),
                  ),
                  DataColumn(
                    label: Text('Нүүрсний төрөл'),
                  ),
                  DataColumn(
                    label: Text('Огноо'),
                  ),
                ],
                source: tableRow,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TableRow extends DataTableSource {
  final Result result;

  TableRow({
    required this.result,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= result.rows!.length) {
      return null;
    }
    Receipt item = result.rows![index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text("${index + 1}."),
        ),
        DataCell(
          SizedBox(
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
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: black, width: 1.5),
                  ),
                  child: Text(
                    item.vehiclePlateNo,
                    style: TextStyle(
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Ачаагүй жин:',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${item.unladedWeight}",
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Ачаатай жин',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${item.fullWeight}",
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              'Цэвэр жин:',
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${item.totalWeight}",
                              style: TextStyle(
                                color: black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        DataCell(
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorRed,
                      ),
                      child: Center(
                          child: Text(
                        item.containerNumbers.first,
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorRed,
                      ),
                      child: Center(
                          child: Text(
                        item.containerNumbers.first,
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorBlue,
                  ),
                  child: Center(
                    child: Text(
                      item.trailerPlateNumbers.first,
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorRed,
                      ),
                      child: Center(
                          child: Text(
                        item.containerNumbers.first,
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorRed,
                      ),
                      child: Center(
                          child: Text(
                        item.containerNumbers.first,
                        style: TextStyle(
                          color: white,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: colorBlue,
                  ),
                  child: Center(
                    child: Text(
                      item.trailerPlateNumbers.first,
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: gray102),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Нэр:',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          item.driverName,
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Регистр:',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          item.driverRegisterNo,
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Утас:',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          item.driverPhone,
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Үнэмлэх (PDL):',
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          item.driverPdlNumber,
                          style: TextStyle(
                            color: black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        DataCell(
          Text(item.receiptNo),
        ),
        DataCell(
          Text(item.supplierName),
        ),
        DataCell(
          Text(item.transportName),
        ),
        DataCell(
          Text(item.contractNo),
        ),
        DataCell(
          Text(item.buyerName),
        ),
        DataCell(
          Text(item.routeName),
        ),
        DataCell(
          Text(item.productName),
        ),
        DataCell(Text(
            DateFormat("yyyy-MM-dd").format(DateTime.parse(item.createdAt)))),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 50;

  @override
  int get selectedRowCount => 0;
}
