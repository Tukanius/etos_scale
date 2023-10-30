import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ReceiptInfo extends StatefulWidget {
  const ReceiptInfo({Key? key}) : super(key: key);

  @override
  State<ReceiptInfo> createState() => _ReceiptInfoState();
}

class _ReceiptInfoState extends State<ReceiptInfo> {
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
              'Баримт',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: Column(
                children: [
                  FormTextField(
                      name: "receiptNo",
                      labelText: "Баримтны дугаар",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  SizedBox(
                    height: 15,
                  ),
                  FormTextField(
                      name: "supplierName",
                      labelText: "Худалдаалагч",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  SizedBox(
                    height: 15,
                  ),
                  FormTextField(
                      name: "transportName",
                      labelText: "Тээвэрлэгч",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                ],
              )),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                children: [
                  FormTextField(
                      name: "contractNo",
                      labelText: "Гэрээний дугаар",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  SizedBox(
                    height: 15,
                  ),
                  FormTextField(
                      name: "buyerName",
                      labelText: "Худалдан авагч",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  SizedBox(
                    height: 15,
                  ),
                  FormTextField(
                      name: "routeName",
                      labelText: "Чиглэл",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                ],
              )),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormTextField(
                      name: "receiptDate",
                      labelText: "Огноо",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  SizedBox(height: 15),
                  FormTextField(
                      name: "productName",
                      labelText: "Нүүрсний төрөл",
                      textColor: Colors.white,
                      labelColor: Colors.white70,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                ],
              ))
            ]),
          ],
        )));
  }
}
