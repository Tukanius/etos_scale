import 'package:etos_scale_windows/api/auth_api.dart';
import 'package:flutter/foundation.dart';
import 'package:etos_scale_windows/models/user.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:platform_device_id/platform_device_id.dart';

class UserProvider extends ChangeNotifier {
  // ignore: unused_field
  String? _deviceId;
  late User? user;
  late String selectedPage = 'ScalePage';
  late String? machineId;
  String? selectedType;

  void updateType(String newType) {
    selectedType = newType;
    notifyListeners();
  }

  Future<void> fetchDeviceId() async {
    String? deviceId = await _getDeviceIdFromPlatform();
    _deviceId = deviceId;
    notifyListeners();
  }

  Future<String?> _getDeviceIdFromPlatform() async {
    try {
      return await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      return 'Failed to get deviceId.';
    }
  }

  void setSelectedPage(String page) {
    selectedPage = page;
    notifyListeners();
  }

  getSelectedSerialPort() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? port = prefs.getString("serialPort");

    return port;
  }

  setSelectedSerialPort(String port) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("serialPort", port);
  }

  static Future<String?> getMachineId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("machineId");

    return token;
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
    await setAccessToken(accessToken);
    notifyListeners();
  }

  setMachineId(String? deviceId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (deviceId != null) prefs.setString("machineId", deviceId);
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
