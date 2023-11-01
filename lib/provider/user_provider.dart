import 'package:etos_scale_windows/api/auth_api.dart';
import 'package:flutter/foundation.dart';
import 'package:etos_scale_windows/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  late User? user;
  late String selectedPage = 'ScalePage';
  late String? selectedSerialPort;

  void setSelectedPage(String page) {
    selectedPage = page;
    notifyListeners();
  }

  void setSerialPort(String port) {
    selectedSerialPort = port;
    notifyListeners();
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("accessToken");
    return token;
  }

  me() async {
    user = await AuthApi().me();
    notifyListeners();
  }

  login(data) async {
    String accessToken = await AuthApi().login(data);
    setAccessToken(accessToken);
    notifyListeners();
  }

  setAccessToken(String? token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token != null) prefs.setString("accessToken", token);
  }

  removeAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("accessToken");
  }

  logout() async {
    user = null;

    removeAccessToken();
  }

  Future auth() async {
    String? token = await getAccessToken();
    if (token != null) {
      await removeAccessToken();
    }
  }
}
