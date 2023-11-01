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
              FormBuilderValidators.required(errorText: 'Заавал бөглөнө үү.'),
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
              FormBuilderValidators.required(errorText: 'Заавал бөглөнө үү.'),
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
              FormBuilderValidators.required(errorText: 'Заавал бөглөнө үү.'),
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
              FormBuilderValidators.required(errorText: 'Заавал бөглөнө үү.'),
            ]),
          ),
        ],
      ),
    );
  }
}
