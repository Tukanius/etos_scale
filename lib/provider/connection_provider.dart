import 'package:flutter/material.dart';

class ConnectionProvider extends ChangeNotifier {
  String? scalePort;
  String selectedItem = 'ScalePage';

  void setSelectedItem(String item) {
    selectedItem = item;
    notifyListeners();
  }

  void changeScalePort(String port) {
    scalePort = port;
    notifyListeners();
  }
}
