import 'package:etos_scale_windows/api/trcuk_api.dart';
import 'package:etos_scale_windows/components/layout/table_header.dart';
import 'package:etos_scale_windows/contants/colors.dart';
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
  int limit = 10;

  Result result = Result(rows: [], count: 0);

  loadData(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();

    result = await TruckApi()
        .scaleList(ResultArguments(filter: filter, offset: offset));
    // debugPrint(scaleList.rows);
  }

  @override
  afterFirstLayout(BuildContext context) {
    loadData(page, limit);
  }

  int currentPage = 1;
  final itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: PaginatedDataTable(
          header: const Text("Хэмжилтийн түүх"),
          onRowsPerPageChanged: (perPage) {},
          rowsPerPage: 10,
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
    );
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
