import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class VehicleInfo extends StatefulWidget {
  const VehicleInfo({Key? key}) : super(key: key);

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();
}

class _VehicleInfoState extends State<VehicleInfo> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: fbKey,
        child: const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Автомашин',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FormTextField(
                  name: "plateNo",
                  labelText: "Улсын дугаар",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              SizedBox(
                height: 15,
              ),
              FormTextField(
                  name: "name",
                  labelText: "Ачаагүй жин",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              SizedBox(
                height: 15,
              ),
              FormTextField(
                  name: "name",
                  labelText: "Ачаатай жин",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              SizedBox(
                height: 15,
              ),
              FormTextField(
                  name: "name",
                  labelText: "Цэвэр жин",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
            ],
          ),
        ));
  }
}
