import 'package:flutter/material.dart';

class ScaleListPage extends StatefulWidget {
  const ScaleListPage({super.key});

  @override
  State<ScaleListPage> createState() => _ScaleListPageState();
}

class _ScaleListPageState extends State<ScaleListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 190, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Жагсаалт',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Expanded(
                  child: Text(
                '№',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Харилцагч',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Машин',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Чиргүүл',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'С зөвшөөрөл',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Жолооч',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Машин жин',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Ач жин',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Цэвэр жин',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Орсон огноо',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Гарсан огноо',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
              Expanded(
                  child: Text(
                'Тээвэрлэгч',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              )),
            ],
          ),
          const SizedBox(
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
                        color: Colors.amber,
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      height: 40,
                      child: const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '203035433',
                            style: TextStyle(
                              color: Colors.white,
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
