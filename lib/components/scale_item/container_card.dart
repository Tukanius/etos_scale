import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/scale_form.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ContainerCard extends StatefulWidget {
  final int index;
  final Color? color;
  final ScaleForm formData;
  const ContainerCard(
      {super.key, required this.index, this.color, required this.formData});

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  get4Controller(int index) {
    switch (index) {
      case 0:
        return widget.formData.containerNumber_0_4Controller;
      case 1:
        return widget.formData.containerNumber_1_4Controller;
      case 2:
        return widget.formData.containerNumber_2_4Controller;
      case 3:
        return widget.formData.containerNumber_3_4Controller;
    }
  }

  get7Controller(int index) {
    switch (index) {
      case 0:
        return widget.formData.containerNumber_0_7Controller;
      case 1:
        return widget.formData.containerNumber_1_7Controller;
      case 2:
        return widget.formData.containerNumber_2_7Controller;
      case 3:
        return widget.formData.containerNumber_3_7Controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gray101,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Чингэлэг",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FormTextField(
                    controller: get4Controller(widget.index),
                    name: "containerNumber_${widget.index}_4",
                    labelText: "AAAA",
                    filled: true,
                    width: 100,
                    fillColor: gray102,
                    textColor: black,
                    labelColor: black,
                    bgColor: Colors.transparent,
                    validator: FormBuilderValidators.compose([
                      (value) {
                        return validateContainer(
                          (value != null ? value as String : value) as String?,
                        );
                      }
                    ]),
                  ),
                  const SizedBox(width: 5),
                  FormTextField(
                    controller: get7Controller(widget.index),
                    name: "containerNumber_${widget.index}_7",
                    labelText: "0000000",
                    filled: true,
                    width: 100,
                    fillColor: gray102,
                    textColor: black,
                    labelColor: black,
                    bgColor: Colors.transparent,
                    validator: FormBuilderValidators.compose([
                      (value) {
                        return validateContainerNumber(
                          (value != null ? value as String : value) as String?,
                        );
                      }
                    ]),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 5),
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: widget.color,
                  ),
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

String? validateContainer(String? value) {
  if (value == null || value.isEmpty || value.length == 4) {
    return null;
  } else {
    return 'Алдаа!';
  }
}

String? validateContainerNumber(String? value) {
  if (value == null || value.isEmpty || value.length == 7) {
    return null;
  } else {
    return 'Алдаа!';
  }
}
