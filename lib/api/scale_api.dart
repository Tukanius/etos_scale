import 'package:etos_scale_windows/models/receipt.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:etos_scale_windows/models/scale.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

// final httpRequest = HttpRequest("http://mine.etos.mn/sca/api");
final httpRequest = HttpRequest("http://192.168.1.96:30606/api");
final httpRequest1 = HttpRequest("http://192.168.1.96:30605/api");

class ScaleApi {
  getScaleList(ResultArguments resultArguments) async {
    var res =
        await httpRequest.get('/truck/scale', data: resultArguments.toJson());

    return Result.fromJson(res, Scale.fromJson);
  }

  getReceiptList(ResultArguments resultArguments) async {
    var res = await httpRequest.get('/receipt', data: resultArguments.toJson());

    return Result.fromJson(res, Receipt.fromJson);
  }

  getNumber(data) async {
    var res = await httpRequest1.get('/vehicle/info', data: data);
    return Scale.fromJson(res);
  }

  truck(data) async {
    var res = await httpRequest.post('/truck/scale', data: data);

    return Scale.fromJson(res);
  }
}
