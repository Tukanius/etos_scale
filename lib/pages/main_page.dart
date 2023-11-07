import 'package:after_layout/after_layout.dart';
import 'package:etos_scale_windows/components/drawer/settings_drawer.dart';
import 'package:etos_scale_windows/components/layout/navbar.dart';
import 'package:etos_scale_windows/contants/colors.dart';
import 'package:etos_scale_windows/pages/scale/receipt_page.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:etos_scale_windows/pages/scale/scale_page.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import "package:flutter_libserialport/flutter_libserialport.dart";
import 'package:socket_io_client/socket_io_client.dart' as io;

class MainPage extends StatefulWidget {
  static const routeName = 'MainPage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin, AfterLayoutMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String scaleData = "000000";

  late io.Socket socket;

  socketListener() {
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

  void _onSidebarItemSelected(String item) {
    Provider.of<UserProvider>(context, listen: false).setSelectedPage(item);
  }

  @override
  afterFirstLayout(BuildContext context) async {
    final serialPort = await Provider.of<UserProvider>(context, listen: false)
        .getSelectedSerialPort();
    if (serialPort != null) {
      final port = SerialPort(serialPort);

      if (!port.isOpen && port.openReadWrite()) {
        if (kDebugMode) {
          debugPrint("PORT OPENED: $serialPort");
          debugPrint(SerialPort.lastError as String?);
        }

        var portConfig = SerialPortConfig()
          ..baudRate = 9600
          ..bits = 8
          ..stopBits = 1;
        port.config = portConfig;

        final reader = SerialPortReader(port);

        var received = "";
        reader.stream.listen((data) {
          var chr = String.fromCharCodes(data);

          received += chr;

          if (received.length == 12) {
            setState(() {
              scaleData = received.substring(2, 8);
            });

            received = "";
          }
        });
      } else {
        if (kDebugMode) {
          debugPrint("PORT ClOSED: $serialPort");
        }
      }
    }
    var machineId = await PlatformDeviceId.getDeviceId;
    socket = io.io(
      'http://192.168.1.96:30605',
      io.OptionBuilder().setTransports(['websocket']).setQuery(
        {
          'machineId': machineId,
          'machineType': 'SCALE',
        },
      ).build(),
    );

    socketListener();
  }

  @override
  Widget build(BuildContext context) {
    String selectedItem = Provider.of<UserProvider>(context).selectedPage;

    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Drawer(
          backgroundColor: colorBlue,
          child: const SettingsDrawer(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: Row(
          children: [
            SizedBox(
              child: CustomSideNavigationBar(
                selectedItem: selectedItem,
                onItemSelected: _onSidebarItemSelected,
                scaffoldKey: _scaffoldKey,
              ),
            ),
            Expanded(
              child: _buildContentSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    final selectedItem = Provider.of<UserProvider>(context).selectedPage;

    if (selectedItem == 'ScalePage') {
      return ScalePage(
        scaleData: scaleData,
      );
    } else if (selectedItem == 'ReceiptPage') {
      return const ReceiptPage();
    }

    return const SizedBox(
      child: Center(
        child: Text('NOTHING IN HERE XD'),
      ),
    );
  }
}
