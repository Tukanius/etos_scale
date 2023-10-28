import 'package:flutter/material.dart';
import 'package:etos_scale_windows/models/user.dart';

class ToolsProvider extends ChangeNotifier {
  User user = User();

  String _selectedItem = 'Home';

  String get selectedItem => _selectedItem;

  void setSelectedItem(String item) {
    _selectedItem = item;
    notifyListeners();
  }
}
