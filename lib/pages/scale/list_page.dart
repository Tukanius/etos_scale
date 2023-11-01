import 'package:etos_scale_windows/api/trcuk_api.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

class ScaleListPage extends StatefulWidget {
  const ScaleListPage({Key? key}) : super(key: key);

  @override
  State<ScaleListPage> createState() => _ScaleListPageState();
}

class _ScaleListPageState extends State<ScaleListPage> with AfterLayoutMixin {
  var tableRow = TableRow();

  int page = 1;
  int limit = 100;

  Result result = Result(rows: [], count: 0);

  loadData(int page, int limit) async {
    Filter filter = Filter();

    Offset offset = Offset(limit: limit, page: page);

    Result res = await TruckApi()
        .scaleList(ResultArguments(filter: filter, offset: offset));

    setState(() => result = res);
  }

  @override
  afterFirstLayout(BuildContext context) {
    loadData(page, limit);
  }

  int currentPage = 1;
  final itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: PaginatedDataTable(
          availableRowsPerPage: const [50, 100],
          header: const Text("Хэмжилтийн түүх"),
          onRowsPerPageChanged: (perPage) {
            setState(() {
              limit = perPage!;
            });
          },
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          rowsPerPage: limit,
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Country'),
            ),
            DataColumn(
              label: Text('Code'),
            ),
            DataColumn(
              label: Text('Continent'),
            ),
          ],
          source: tableRow,
        ),
      ),
    ));
  }
}

class TableRow extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("Cell $index")),
      DataCell(Text("Cell $index")),
      DataCell(Text("Cell $index")),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 50;

  @override
  int get selectedRowCount => 0;
}
