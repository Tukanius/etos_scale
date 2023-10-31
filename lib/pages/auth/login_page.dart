import 'package:etos_scale_windows/components/ui/button.dart';
import 'package:etos_scale_windows/components/ui/form_text_field.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/splash/splash_page.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "LoginPage";
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormBuilderState> fbkey = GlobalKey<FormBuilderState>();

  onSubmit() async {
    final form = fbkey.currentState;

    if (form!.saveAndValidate()) {
      await Provider.of<UserProvider>(context, listen: false).login(form.value);

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed(SplashPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlue,
        body: Center(
          child: Container(
            width: 1200,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: gray101,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 700,
                  height: 600,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    child: Image.asset(
                      'assets/images/loginbg.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  width: 500,
                  height: 600,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Нэвтрэх',
                        style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                      FormBuilder(
                        key: fbkey,
                        child: Column(
                          children: [
                            FormTextField(
                              name: "username",
                              labelText: "Нэвтрэх нэр",
                              filled: true,
                              width: 300,
                              fillColor: gray102,
                              textColor: black,
                              labelColor: black,
                              bgColor: Colors.transparent,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: 'Заавал бөглөнө үү.',
                                ),
                              ]),
                            ),
                            const SizedBox(height: 20),
                            FormTextField(
                              name: "password",
                              labelText: "Нууц үг",
                              filled: true,
                              width: 300,
                              fillColor: gray102,
                              textColor: black,
                              labelColor: black,
                              bgColor: Colors.transparent,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: 'Заавал бөглөнө үү.',
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: Button(
                          labelText: "Нэвтрэх",
                          color: primary,
                          onPress: onSubmit,
                        ),
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
