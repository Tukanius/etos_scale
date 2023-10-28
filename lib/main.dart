import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:etos_scale_windows/provider/tools_provider.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:etos_scale_windows/screens/main_page.dart';
import 'package:etos_scale_windows/screens/splash/splash_page.dart';
import 'package:etos_scale_windows/services/dialog.dart';
import 'package:etos_scale_windows/services/navigation.dart';
import 'package:provider/provider.dart';

void main() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  DartPluginRegistrant.ensureInitialized();

  runApp(const MyApp());
}

GetIt locator = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static int invalidTokenCount = 0;

  static setInvalidToken(int count) {
    invalidTokenCount = count;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ToolsProvider()),
      ],
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return MaterialApp(
            title: 'E-TOS',
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case MainPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  });
                default:
                  return MaterialPageRoute(
                    builder: (_) => const SplashPage(),
                  );
              }
            },
          );
        },
      ),
    );
  }
}
