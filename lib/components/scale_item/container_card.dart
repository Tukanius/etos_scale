import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ContainerCard extends StatefulWidget {
  const ContainerCard({
    super.key,
  });

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: fbKey,
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorBlue,
          ),
          padding: const EdgeInsets.all(15),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Чингэлэг",
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
                    name: "num1",
                    labelText: "AAAA",
                    width: 80,
                    textColor: Colors.white,
                    labelColor: Colors.white70,
                    bgColor: Colors.transparent,
                  ),
                  SizedBox(width: 5),
                  FormTextField(
                    name: "num2",
                    labelText: "0000000",
                    width: 100,
                    textColor: Colors.white,
                    labelColor: Colors.white70,
                    bgColor: Colors.transparent,
                  ),
                  SizedBox(width: 5),
                  FormTextField(
                    name: "num3",
                    labelText: "[?]",
                    width: 60,
                    textColor: Colors.white,
                    labelColor: Colors.white70,
                    bgColor: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              FormTextField(
                name: "num4",
                labelText: "AAAA",
                width: 80,
                textColor: Colors.white,
                labelColor: Colors.white70,
                bgColor: Colors.transparent,
              ),
            ],
          ),
        ));
  }
}
