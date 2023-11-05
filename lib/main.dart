import 'dart:async';
import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/pages/auth/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:etos_scale_windows/pages/main_page.dart';
import 'package:etos_scale_windows/pages/splash/splash_page.dart';
import 'package:etos_scale_windows/services/dialog.dart';
import 'package:etos_scale_windows/services/navigation.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  DartPluginRegistrant.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

GetIt locator = GetIt.instance;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterLayoutMixin {
  String? _deviceId;
  late IO.Socket socket;

  Future<void> initPlatformState() async {
    String? deviceId;
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      if (kDebugMode) {
        print("deviceId->$_deviceId");
      }
    });
  }

  _connectSocket() {
    socket.onConnect((data) => debugPrint('Socket Connection'));
    socket.onDisconnect((data) => debugPrint('Disconnect'));
    socket.onConnectError((data) => debugPrint('Socket Connection Error'));
    socket.on('data', (data) {
      debugPrint('Received data from server: $data');
    });
    socket.onReconnect((data) {
      debugPrint('Reconnected to the socket server');
    });
    socket.onReconnecting((data) {
      debugPrint('Reconnecting to the socket server');
    });
  }

  @override
  afterFirstLayout(BuildContext context) async {
    await initPlatformState();
    socket = IO.io(
      'http://192.168.1.8:30605',
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
        {
          'machineId': _deviceId,
          'machineType': 'SCALE',
        },
      ).build(),
    );
    _connectSocket();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Consumer<UserProvider>(
        builder: (context, userProvider, _) {
          return MaterialApp(
            // scrollBehavior: MyCustomScrollBehavior(),
            title: 'E-TOS',
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) => Stack(
              children: [child!, const DropdownAlert()],
            ),
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case MainPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const MainPage();
                  });
                case LoginPage.routeName:
                  return MaterialPageRoute(builder: (context) {
                    return const LoginPage();
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
