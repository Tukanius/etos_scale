import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/api/scale_api.dart';
import 'package:etos_scale_windows/components/info/scale_card.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:etos_scale_windows/models/scale.dart';
import 'package:flutter/material.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> with AfterLayoutMixin {
  int page = 1;
  int limit = 30;
  bool isLoading = false;
  Result result = Result(count: 0, rows: []);

  loadData(int page, int limit) async {
    Filter filter = Filter();
    Offset offset = Offset(limit: limit, page: page);

    var res =
        await ScaleApi().list(ResultArguments(filter: filter, offset: offset));

    setState(() {
      result = res;
    });
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
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(20),
        child: isLoading == false
            ? Center(
                child: CircularProgressIndicator(
                  color: colorBlue,
                ),
              )
            : Column(
                children: result.rows!
                    .map((row) => ScaleCard(data: row as Scale))
                    .toList(),
              ),
      ),
    );
  }
}
