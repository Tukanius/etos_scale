import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

final httpRequest = HttpRequest("http://192.168.1.96:30605/api");

class TruckApi {
  scale(data) async {
    var res = await httpRequest.post('/truck/scale', data: data);

    return Receipt.fromJson(res as Map<String, dynamic>);
  }

  scaleList(ResultArguments resultArguments) async {
    var res =
        await httpRequest.get('/truck/receipt', data: resultArguments.toJson());
    return Result.fromJson(res, Receipt.fromJson);
  }
}
