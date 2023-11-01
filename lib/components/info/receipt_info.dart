import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ReceiptInfo extends StatefulWidget {
  const ReceiptInfo({Key? key}) : super(key: key);

  @override
  State<ReceiptInfo> createState() => _ReceiptInfoState();
}

class _ReceiptInfoState extends State<ReceiptInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Баримт',
          style: TextStyle(
            color: black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              children: [
                FormTextField(
                  name: "receiptNo",
                  labelText: "Баримтны дугаар",
                  filled: true,
                  fillColor: gray102,
                  textColor: black,
                  labelColor: black,
                  bgColor: Colors.transparent,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал бөглөнө үү.'),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                FormTextField(
                  name: "supplierName",
                  labelText: "Худалдаалагч",
                  filled: true,
                  fillColor: gray102,
                  textColor: black,
                  labelColor: black,
                  bgColor: Colors.transparent,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал бөглөнө үү.'),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                FormTextField(
                  name: "transportName",
                  labelText: "Тээвэрлэгч",
                  filled: true,
                  fillColor: gray102,
                  textColor: black,
                  labelColor: black,
                  bgColor: Colors.transparent,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал бөглөнө үү.'),
                  ]),
                ),
              ],
            )),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              children: [
                FormTextField(
                  name: "contractNo",
                  labelText: "Гэрээний дугаар",
                  filled: true,
                  fillColor: gray102,
                  textColor: black,
                  labelColor: black,
                  bgColor: Colors.transparent,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал бөглөнө үү.'),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                FormTextField(
                  name: "buyerName",
                  labelText: "Худалдан авагч",
                  filled: true,
                  fillColor: gray102,
                  textColor: black,
                  labelColor: black,
                  bgColor: Colors.transparent,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал бөглөнө үү.'),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                FormTextField(
                  name: "routeName",
                  labelText: "Чиглэл",
                  filled: true,
                  fillColor: gray102,
                  textColor: black,
                  labelColor: black,
                  bgColor: Colors.transparent,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'Заавал бөглөнө үү.'),
                  ]),
                ),
              ],
            )),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormTextField(
                    name: "receiptDate",
                    labelText: "Огноо",
                    filled: true,
                    fillColor: gray102,
                    readOnly: true,
                    textColor: black,
                    labelColor: black,
                    bgColor: Colors.transparent,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Заавал бөглөнө үү.'),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  FormTextField(
                    name: "productName",
                    labelText: "Нүүрсний төрөл",
                    filled: true,
                    fillColor: gray102,
                    textColor: black,
                    labelColor: black,
                    bgColor: Colors.transparent,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Заавал бөглөнө үү.'),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
