import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/models/scale_form.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SealCard extends StatefulWidget {
  final int index;
  final Color? color;
  final ScaleForm formData;
  const SealCard(
      {super.key, required this.index, this.color, required this.formData});

  @override
  State<SealCard> createState() => _SealCardState();
}

class _SealCardState extends State<SealCard> {
  getConroller(int index) {
    switch (index) {
      case 0:
        return widget.formData.sealNumber_0Controller;
      case 1:
        return widget.formData.sealNumber_1Controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 580,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gray101,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Лац ${widget.index + 1}",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          FormTextField(
            controller: getConroller(widget.index),
            name: "sealNumber_${widget.index}",
            labelText: "",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validateSealCard(
                  (value != null ? value as String : value) as String?,
                );
              }
            ]),
          ),
        ],
      ),
    );
  }
}

String? validateSealCard(String? value) {
  if (value == null || value.isEmpty || value.length == 4) {
    return null;
  } else {
    return 'Алдаа!';
  }
}
