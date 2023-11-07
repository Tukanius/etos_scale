import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:etos_scale_windows/provider/user_provider.dart';
import 'package:etos_scale_windows/services/dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'http_handler.dart';
import '../main.dart';

class HttpRequest {
  String host = 'http://mine.etos.mn/sca/api';
  // String host = 'http://192.168.1.8:30605/api';

  Dio dio = Dio();

  HttpRequest(String? host) {
    if (host != null) this.host = host;
  }

  Future<dynamic> request(String api, String method, dynamic data,
      {bool handler = true, bool approve = false}) async {
    Response? response;
    final String uri;

    uri = '$host$api';
    debugPrint(uri);

    debugPrint('+++++++++++++++++++++++HANDLER++++++++++++++++++++++++++++');
    debugPrint('handler: $handler');
    debugPrint('+++++++++++++++++++++++++HANDLER++++++++++++++++++++++++++ ');

    try {
      Directory dir = await getTemporaryDirectory();
      CookieJar cookieJar =
          PersistCookieJar(storage: FileStorage(dir.path), ignoreExpires: true);

      dio.interceptors.add(CookieManager(cookieJar));

      var accessToken = await UserProvider.getAccessToken();
      var machineType = 'SCALE';
      dio.options.headers = {
        'authorization': 'Bearer $accessToken',
        'machine-type': machineType,
      };
    } catch (err) {
      debugPrint(err.toString());
    }

    if (method != 'GET') {
      debugPrint('body: $data');
    }

    try {
      switch (method) {
        case 'GET':
          {
            response = await dio.get(
              uri,
              queryParameters: data,
            );
            break;
          }
        case 'POST':
          {
            response = await dio.post(uri, data: data);
            break;
          }
        case 'PUT':
          {
            response = await dio.put(uri, data: data);
            break;
          }
        case 'DELETE':
          {
            response = await dio.delete(uri, data: data);
            break;
          }
      }

      return HttpHandler(statusCode: response?.statusCode).handle(response);
      // ignore: deprecated_member_use
    } on DioError catch (ex) {
      // try {
      //   result = await _connectivity.checkConnectivity();
      //   if (result == ConnectivityResult.none) {
      //     MyApp.dialogService!
      //         .showInternetErrorDialog("No internet connection");
      //     return null;
      //   }
      // } on PlatformException catch (e) {
      //   debugPrint(e.toString());
      // }

      HttpHandler? error =
          HttpHandler(statusCode: ex.response?.statusCode).handle(ex.response);

      if (handler == true && error!.message != null) {
        final DialogService dialogService = locator<DialogService>();
        dialogService.showErrorDialog(error.message.toString());
      }

      throw error!;
    }
  }

  Future<dynamic> get(String url, {dynamic data, bool handler = true}) async {
    try {
      return await request(url, 'GET', data, handler: handler);
    } catch (e) {
      debugPrint("GET => $e");
      rethrow;
    }
  }

  Future<dynamic> post(String url,
      {dynamic data, bool handler = true, bool approve = false}) async {
    try {
      return await request(
        url,
        'POST',
        data,
        handler: handler,
        approve: approve,
      );
    } catch (ex) {
      debugPrint("POST => $ex");
      rethrow;
    }
  }

  Future<dynamic> put(String url, {dynamic data, bool handler = true}) async {
    try {
      return await request(url, 'PUT', data, handler: handler);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> del(String url, {dynamic data, bool handler = true}) async {
    return await request(url, 'DELETE', data, handler: handler);
  }
}
