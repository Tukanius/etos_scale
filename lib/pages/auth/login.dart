import 'package:etos_scale_windows/components/ui/button.dart';
import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "LoginPage";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();
  onSubmit() {
    if (fbkey.currentState!.saveAndValidate()) {
      Navigator.of(context).pushNamed(MainPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlue,
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colorBlue,
            ),
            margin: const EdgeInsets.symmetric(vertical: 30),
            width: 1180,
            child: Row(
              children: [
                Container(
                  width: 1180 / 2,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    color: colorBlue,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Нэвтрэх',
                            style: TextStyle(
                              color: colorWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: 35,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          FormBuilder(
                            key: fbkey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 350,
                                  child: FormTextField(
                                    name: "username",
                                    labelText: "Нэвтрэх нэр",
                                    textColor: Colors.white,
                                    labelColor: Colors.white70,
                                    fillColor: colorBlue,
                                    bgColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: 'Заавал бөглөнө үү.')
                                    ]),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 350,
                                  child: FormTextField(
                                    name: "password",
                                    labelText: "Нууц үг",
                                    textColor: Colors.white,
                                    labelColor: Colors.white70,
                                    fillColor: colorBlue,
                                    bgColor: Colors.transparent,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 10),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                          errorText: 'Заавал бөглөнө үү.')
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: Button(
                              color: colorSecondary,
                              labelText: "Нэвтрэх",
                              onPress: () {
                                onSubmit();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
