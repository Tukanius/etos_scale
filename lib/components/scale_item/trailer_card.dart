import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/scale_form.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TrailerCard extends StatefulWidget {
  final int index;
  final ScaleForm formData;
  const TrailerCard({Key? key, required this.index, required this.formData})
      : super(key: key);

  @override
  State<TrailerCard> createState() => _TrailerCardState();
}

class _TrailerCardState extends State<TrailerCard> {
  getConroller(int index) {
    switch (index) {
      case 0:
        return widget.formData.trailerPlateNumber_0Controller;
      case 1:
        return widget.formData.trailerPlateNumber_1Controller;
    }
  }

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
                      controller: getConroller(widget.index),
                      bgColor: Colors.transparent,
                      name: "trailerPlateNumber_${widget.index}",
                      labelText: "Улсын дугаар",
                      width: 160,
                      filled: true,
                      textColor: black,
                      labelColor: white,
                      fillColor: white,
                      validator: FormBuilderValidators.compose([
                        (value) {
                          return validateTrail(
                            (value != null ? value as String : value)
                                as String?,
                          );
                        }
                      ])),
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

String? validateTrail(String? value) {
  if (value == null || value.isEmpty || value.length == 6) {
    return null;
  } else {
    return 'Алдаа!';
  }
}
