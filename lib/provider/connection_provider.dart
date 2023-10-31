import 'package:flutter/material.dart';

class ConnectionProvider extends ChangeNotifier {
  String? selectedSerialPort;
  String selectedItem = 'ScalePage';

  void setSelectedItem(String item) {
    selectedItem = item;
    notifyListeners();
  }

  void setSerialPort(String port) {
    selectedSerialPort = port;
    notifyListeners();
  }
}
