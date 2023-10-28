import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/widgets/colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:etos_scale_windows/widgets/form_textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InformationCard extends StatefulWidget {
  final scaleData;
  const InformationCard({Key? key, required this.scaleData}) : super(key: key);

  @override
  State<InformationCard> createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  onConfirm(context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: SizedBox(
              width: 950,
              height: 460,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30, top: 20),
                          child: SvgPicture.asset(
                            'assets/svg/close.svg',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  onSubmit(ctx) async {
    if (fbKey.currentState!.saveAndValidate()) {
      setState(() {
        isLoading = true;
      });
      try {
        onConfirm(context);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: darkgrey,
      ),
      height: 400,
      child: FormBuilder(
        key: fbKey,
        child: Row(
          children: [
            const Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Автомашины мэдээлэл',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Автомашины дугаар",
                    inputType: TextInputType.text,
                    name: 'carnumber',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Ачаагүй жин",
                    inputType: TextInputType.text,
                    name: 'weight1',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Ачаатай жин",
                    inputType: TextInputType.text,
                    name: 'weight12',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Цэвэр жин",
                    inputType: TextInputType.text,
                    name: 'weight123',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: black.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Text(
                          widget.scaleData,
                          style: const TextStyle(
                            color: white,
                            fontSize: 70,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onSubmit(context);
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44),
                          color: darkgrey,
                        ),
                        child: const Center(
                          child: Text(
                            'Баталгаажуулалт',
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Жолоочийн мэдээлэл',
                    style: TextStyle(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Овог нэр",
                    inputType: TextInputType.text,
                    name: 'name',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Регистр №",
                    inputType: TextInputType.text,
                    name: 'register',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "Утас",
                    inputType: TextInputType.text,
                    name: 'phone',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                  FormTextField(
                    textColor: white,
                    labelText: "№",
                    inputType: TextInputType.text,
                    name: 'no',
                    hintText: '000000000',
                    color: lightgrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
