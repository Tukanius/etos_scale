import 'package:flutter/material.dart';
import 'package:etos_scale_windows/widgets/colors.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 190, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Жагсаалт',
            style: TextStyle(
                color: white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                '№',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Харилцагч',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Машин',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Чиргүүл',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'С зөвшөөрөл',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Жолооч',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Машин жин',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Ач жин',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Цэвэр жин',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Орсон огноо',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Гарсан огноо',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Тээвэрлэгч',
                style: TextStyle(
                    color: white, fontSize: 16, fontWeight: FontWeight.w600),
              )),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            child: Expanded(
              child: Column(
                children: [
                  for (var i = 0; i < 10; i++)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: listcolor,
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                      height: 40,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '203035433',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
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
