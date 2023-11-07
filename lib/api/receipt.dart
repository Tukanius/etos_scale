import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

final httpRequest = HttpRequest("http://192.168.1.8:30606/api");

class ReceiptApi {
  found(value) async {
    Map<String, dynamic> params = {};

    params['vehiclePlateNo'] = value;

    var res = await httpRequest.get('/receipt/found', data: params);

    if (res != null) {
      return Receipt.fromJson(res);
    } else {
      return null;
    }
  }
}
