import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:etos_scale_windows/models/scale.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

// final httpRequest = HttpRequest("http://mine.etos.mn/sca/api");
final httpRequest = HttpRequest('http://192.168.1.8:30605/api');

class ScaleApi {
  getScaleList(ResultArguments resultArguments) async {
    var res =
        await httpRequest.get('/truck/scale', data: resultArguments.toJson());

    return Result.fromJson(res, Scale.fromJson);
  }

  getReceiptList(data) async {
    var res = await httpRequest.get('/receipt', data: data);

    return Result.fromJson(res, Receipt.fromJson);
  }

  truck(data) async {
    var res = await httpRequest.post('/truck/scale', data: data);

    return Scale.fromJson(res);
  }
}
