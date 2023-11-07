import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

final httpRequest = HttpRequest("http://192.168.1.8:30606/app");

class ReceiptApi {
  found(String vehiclePlateNo) async {
    var res = await httpRequest.get('/truck/scale', data: {vehiclePlateNo});

    return Receipt.fromJson(res);
  }
}
