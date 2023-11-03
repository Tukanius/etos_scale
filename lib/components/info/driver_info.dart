import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Жолооч',
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
            name: "driverRegisterNo",
            labelText: "Регистрийн дугаар",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validateRegisterNo(
                  (value != null ? value as String : value) as String?,
                );
              }
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            name: "driverName",
            labelText: "Овог нэр",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Алдаа!'),
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            name: "driverPdlNumber",
            labelText: "Үнэмлэх (PDL)",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validatePdl(
                  (value != null ? value as String : value) as String?,
                );
              }
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          FormTextField(
            name: "driverPhone",
            labelText: "Утас",
            filled: true,
            fillColor: gray102,
            textColor: black,
            labelColor: black,
            bgColor: Colors.transparent,
            validator: FormBuilderValidators.compose([
              (value) {
                return validateNumber(
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

String? validateRegisterNo(String? value) {
  RegExp regex = RegExp(r'[а-яА-ЯёЁөӨүҮ]{2}\d{8}$');
  if (value != null && regex.hasMatch(value)) {
    return null;
  } else {
    return 'Алдаа!';
  }
}

String? validateNumber(String? value) {
  final RegExp numericRegex = RegExp(r'^[0-9]+$');
  if (value != null && numericRegex.hasMatch(value) && value.length == 8) {
    return null;
  } else {
    return 'Алдаа!';
  }
}

String? validatePdl(String? value) {
  final RegExp numericRegex = RegExp(r'^[0-9]+$');
  if (value != null && numericRegex.hasMatch(value) && value.length == 5) {
    return null;
  } else {
    return 'Алдаа!';
  }
}
