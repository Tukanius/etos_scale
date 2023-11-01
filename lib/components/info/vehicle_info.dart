import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class VehicleInfo extends StatefulWidget {
  const VehicleInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Автомашин',
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FormTextField(
            name: "vehiclePlateNo",
            labelText: "Улсын дугаар",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return carNumber(
                  (value != null ? value as String : value) as String?,
                );
              }
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            name: "unladedWeight",
            labelText: "Ачаагүй жин",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validateWeight(
                  (value != null ? value as String : value) as String?,
                );
              }
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            name: "fullWeight",
            labelText: "Ачаатай жин",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validateWeight(
                  (value != null ? value as String : value) as String?,
                );
              }
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            name: "totalWeight",
            labelText: "Цэвэр жин",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validateWeight(
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

String? carNumber(String? value) {
  if (value != null && value.length == 7) {
    return null;
  } else {
    return 'Алдаа!';
  }
}

String? validateWeight(String? value) {
  final RegExp numericRegex = RegExp(r'^[0-9]+$');
  if (value != null && numericRegex.hasMatch(value)) {
    return null;
  } else {
    return 'Алдаа!';
  }
}
