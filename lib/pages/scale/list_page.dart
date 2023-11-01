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
  int page = 1;
  int limit = 10;
  Result scaleList = Result(rows: [], count: 0);
  list(page, limit) async {
    Offset offset = Offset(page: page, limit: limit);
    Filter filter = Filter();
    scaleList = await TruckApi()
        .scaleList(ResultArguments(filter: filter, offset: offset));
    // debugPrint(scaleList.rows);
  }

  @override
  afterFirstLayout(BuildContext context) {
    list(page, limit);
  }

  int currentPage = 1;
  final itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: gray101,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'Жагсаалт',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const ListTitle(),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: scaleList.rows?.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Container(
                                    width: 350,
                                    height: 350,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Center(
                                          child: Text(
                                            'Row Data',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        // Text('Index: ${row['index']}'),
                                        // Text('Name: ${row['name']}'),
                                        // Text('Author: ${row['author']}'),
                                        // Text('Quantity: ${row['quantity']}'),
                                        // Text('Date1: ${row['date1']}'),
                                        // Text('Date2: ${row['date2']}'),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      // row['name']!,
                                      '1',

                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      // row['author']!,
                                      '1',

                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      // row['quantity']!,
                                      '1',

                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      // row['date1']!,
                                      '1',

                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      // row['date2']!,
                                      '1',

                                      style: TextStyle(
                                        color: black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                indent: 30,
                                endIndent: 30,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Page $currentPage - ${currentPage * itemsPerPage} of ${scaleList.rows?.length}',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentPage > 1) {
                              setState(() {
                                currentPage--;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: gray102),
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentPage <
                                (scaleList.rows!.length / itemsPerPage)
                                    .ceil()) {
                              setState(() {
                                currentPage++;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: gray102),
                            padding: const EdgeInsets.all(10),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
