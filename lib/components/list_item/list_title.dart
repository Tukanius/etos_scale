import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class ListTitle extends StatefulWidget {
  const ListTitle({super.key});

  @override
  State<ListTitle> createState() => _ListTitleState();
}

class _ListTitleState extends State<ListTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      color: white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '№',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Машин',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Жолооч',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Ачааны жин',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Орсон огноо',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Гарсан огноо',
            style: TextStyle(
              color: black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
