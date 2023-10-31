import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/auth/login.dart';
// import 'package:etos_scale_windows/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/pages/main_page.dart';
import "package:after_layout/after_layout.dart";

class SplashPage extends StatefulWidget {
  static const routeName = 'SplashPage';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  afterFirstLayout(BuildContext context) async {
    try {
      // await Provider.of<UserProvider>(context, listen: false).me(false);
      Navigator.of(context).pushNamed(LoginPage.routeName);
      // Navigator.of(context).pushNamed(MainPage.routeName);
    } catch (e) {
      Navigator.of(context).pushNamed(MainPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlue,
      body: Center(
        child: CircularProgressIndicator(
          color: colorWhite,
        ),
      ),
    );
  }
}
