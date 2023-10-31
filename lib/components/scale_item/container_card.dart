import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ContainerCard extends StatefulWidget {
  final int index;
  const ContainerCard({super.key, required this.index});

  @override
  State<ContainerCard> createState() => _ContainerCardState();
}

class _ContainerCardState extends State<ContainerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: gray101,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Чингэлэг",
            style: TextStyle(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FormTextField(
                    name: "AAAA${widget.index}",
                    labelText: "AAAA",
                    filled: true,
                    width: 100,
                    fillColor: gray102,
                    textColor: black,
                    labelColor: black,
                    bgColor: Colors.transparent,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Заавал бөглөнө үү.'),
                    ]),
                  ),
                  const SizedBox(width: 5),
                  FormTextField(
                    name: "num2${widget.index}",
                    labelText: "0000000",
                    filled: true,
                    width: 100,
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
              widget.index == 1
                  ? Container(
                      margin: const EdgeInsets.only(top: 20, left: 5),
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: colorBlue,
                      ),
                      child: Center(
                        child: Text(
                          '[${widget.index}]',
                        ),
                      ),
                    )
                  : widget.index == 2
                      ? Container(
                          margin: const EdgeInsets.only(top: 20, left: 5),
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorRed,
                          ),
                          child: Center(
                            child: Text(
                              '[${widget.index}]',
                            ),
                          ),
                        )
                      : widget.index == 3
                          ? Container(
                              margin: const EdgeInsets.only(top: 20, left: 5),
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: colorGreen,
                              ),
                              child: Center(
                                child: Text(
                                  '[${widget.index}]',
                                ),
                              ),
                            )
                          : widget.index == 4
                              ? Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, left: 5),
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: colorYellow,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '[${widget.index}]',
                                    ),
                                  ),
                                )
                              : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
