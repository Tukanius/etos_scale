import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';

class TrailerCard extends StatefulWidget {
  const TrailerCard({super.key});

  @override
  State<TrailerCard> createState() => _TrailerCardState();
}

class _TrailerCardState extends State<TrailerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280 * 2 + 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: colorBaseBg2),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Чиргүүл",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  FormTextField(
                      name: "number",
                      labelText: "0000",
                      width: 80,
                      textColor: Colors.white,
                      labelColor: Colors.white70),
                  SizedBox(width: 5),
                  FormTextField(
                      name: "character",
                      labelText: "AAA",
                      width: 80,
                      textColor: Colors.white,
                      labelColor: Colors.white70),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
