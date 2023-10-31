import 'package:etos_scale_windows/components/list_item/list_title.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class ScaleListPage extends StatefulWidget {
  const ScaleListPage({Key? key}) : super(key: key);

  @override
  State<ScaleListPage> createState() => _ScaleListPageState();
}

class _ScaleListPageState extends State<ScaleListPage> {
  List<Map<String, String>> rowData = [
    {
      'index': '1',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '2',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '3',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '4',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '5',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '6',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '7',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '8',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '9',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30 ',
    },
    {
      'index': '10',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
    {
      'index': '11',
      'name': '0844 УНҮ',
      'author': 'М.Алтантулга',
      'quantity': ' 15т ',
      'date1': '2023/10/31 15:31:30',
      'date2': '2023/10/31 15:31:30',
    },
  ];

  int currentPage = 1;
  final itemsPerPage = 10;

  List<Map<String, String>> getItemsForCurrentPage() {
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage) < rowData.length
        ? (startIndex + itemsPerPage)
        : rowData.length;
    return rowData.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    final currentItems = getItemsForCurrentPage();
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
                      itemCount: currentItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        final row = currentItems[index];
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
                                        Text('Index: ${row['index']}'),
                                        Text('Name: ${row['name']}'),
                                        Text('Author: ${row['author']}'),
                                        Text('Quantity: ${row['quantity']}'),
                                        Text('Date1: ${row['date1']}'),
                                        Text('Date2: ${row['date2']}'),
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
                                      row['index']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      row['name']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      row['author']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      row['quantity']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      row['date1']!,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      row['date2']!,
                                      style: const TextStyle(
                                        color: Colors.black,
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
                          'Page $currentPage - ${currentPage * itemsPerPage} of ${rowData.length}',
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
                          child: const Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 35,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentPage <
                                (rowData.length / itemsPerPage).ceil()) {
                              setState(() {
                                currentPage++;
                              });
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 35,
                          ),
                        )
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
