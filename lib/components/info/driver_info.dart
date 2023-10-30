import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DriverInfo extends StatefulWidget {
  const DriverInfo({Key? key}) : super(key: key);

  @override
  State<DriverInfo> createState() => _DriverInfoState();
}

class _DriverInfoState extends State<DriverInfo> {
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
                'Жолооч',
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
                  name: "name",
                  labelText: "Овог нэр",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              SizedBox(
                height: 15,
              ),
              FormTextField(
                  name: "registerNo",
                  labelText: "Регистрийн дугаар",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              SizedBox(
                height: 15,
              ),
              FormTextField(
                  name: "pdlNumber",
                  labelText: "Үнэмлэх (PDL)",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
              SizedBox(
                height: 15,
              ),
              FormTextField(
                  name: "phone",
                  labelText: "Утас",
                  textColor: Colors.white,
                  labelColor: Colors.white70,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
            ],
          ),
        ));
  }
}
