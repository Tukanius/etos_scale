import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/models/user.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

final httpRequest = HttpRequest("http://192.168.1.96:30605/api");

class TruckApi {
  scale(Receipt receipt) async {
    var res = await httpRequest.post('/truck/scale', data: receipt.toJson());

    return User.fromAuthJson(res as Map<String, dynamic>);
  }
}
