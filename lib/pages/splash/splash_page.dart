// ignore_for_file: use_build_context_synchronously

import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/auth/login_page.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/pages/main_page.dart';
import "package:after_layout/after_layout.dart";
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';

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
      var deviceId = await PlatformDeviceId.getDeviceId;

      await Provider.of<UserProvider>(context, listen: false)
          .setMachineId(deviceId);

      await Provider.of<UserProvider>(context, listen: false).me();

      Navigator.of(context).pushNamed(MainPage.routeName);
    } catch (ex) {
      debugPrint(ex.toString());

      Navigator.of(context).pushNamed(LoginPage.routeName);
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
