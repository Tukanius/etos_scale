import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class VehicleInfo extends StatefulWidget {
  final Function(String?) onChangeVehicleNo;
  final bool isSearchable;
  const VehicleInfo(
      {Key? key, required this.onChangeVehicleNo, required this.isSearchable})
      : super(key: key);

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
            height: 15,
          ),
          Stack(
            children: [
              FormTextField(
                onChange: widget.onChangeVehicleNo,
                name: "vehiclePlateNo",
                labelText: "Улсын дугаар",
                filled: true,
                fillColor: gray102,
                textColor: black,
                labelColor: black,
                bgColor: Colors.transparent,
                validator: FormBuilderValidators.compose([
                  // (value) {
                  //   return carNumber(
                  //     (value != null ? value as String : value) as String?,
                  //   );
                  // }
                  FormBuilderValidators.required(errorText: 'Алдаа!'),
                ]),
              ),
              Positioned(
                right: 10,
                bottom: 7,
                child: widget.isSearchable
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: colorBlue,
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Жолоочийн нэр',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: gray102,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Регистрийн дугаар',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: gray102,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Утасны дугаар',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: black,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: gray102,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        'dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

// String? carNumber(String? value) {
//   final pattern = RegExp(r'^\d{4}');
//   if (value != null && value.length == 7 && pattern.hasMatch(value) == true) {
//     return null;
//   } else {
//     return 'Алдаа!';
//   }
// }
