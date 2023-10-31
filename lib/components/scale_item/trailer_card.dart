import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TrailerCard extends StatefulWidget {
  final int index;
  const TrailerCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<TrailerCard> createState() => _TrailerCardState();
}

class _TrailerCardState extends State<TrailerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290 * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primary),
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Чиргүүл",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  FormTextField(
                    bgColor: Colors.transparent,
                    name: "number${widget.index}",
                    labelText: "0000",
                    width: 80,
                    filled: true,
                    textColor: black,
                    labelColor: black,
                    fillColor: white,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Заавал бөглөнө үү.'),
                    ]),
                  ),
                  const SizedBox(width: 5),
                  FormTextField(
                    name: "character${widget.index}",
                    labelText: "AAA",
                    width: 80,
                    textColor: black,
                    bgColor: Colors.transparent,
                    labelColor: black,
                    filled: true,
                    fillColor: white,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Заавал бөглөнө үү.'),
                    ]),
                  ),
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
