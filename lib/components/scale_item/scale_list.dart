import 'package:etos_scale_windows/models/receipt.dart';
import 'package:flutter/material.dart';

class ScaleListData extends StatefulWidget {
  final Receipt? data;
  const ScaleListData({super.key, this.data});

  @override
  State<ScaleListData> createState() => _ScaleListDataState();
}

class _ScaleListDataState extends State<ScaleListData> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.data?.rows?.length,
        itemBuilder: (BuildContext context, int index) {
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // scaleList.row!,
                        '1',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        // row['name']!,
                        '1',

                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        // row['author']!,
                        '1',

                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        // row['quantity']!,
                        '1',

                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        // row['date1']!,
                        '1',

                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        // row['date2']!,
                        '1',

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
    );
  }
}
