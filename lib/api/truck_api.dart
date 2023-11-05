import 'package:etos_scale_windows/models/truck_receipt.dart';
import 'package:etos_scale_windows/models/result.dart';
import 'package:etos_scale_windows/models/truck_scale_form.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

final httpRequest = HttpRequest("http://mine.etos.mn/sca/api");
final httpRequest1 = HttpRequest('http://192.168.1.96:30605/api');

class TruckApi {
  // scale(data) async {
  //   var res = await httpRequest.post('/truck/scale', data: data);

  //   return Receipt.fromJson(res as Map<String, dynamic>);
  // }

  // scaleList(ResultArguments resultArguments) async {
  //   var res =
  //       await httpRequest.get('/truck/receipt', data: resultArguments.toJson());
  //   return Result.fromJson(res, Receipt.fromJson);
  // }

  scaleReceipt(data) async {
    var res = await httpRequest1.post('/truck/scale', data: data);
    return TruckScaleForm.fromJson(res as Map<String, dynamic>);
  }

  // scaleReceiptList(ResultArguments resultArguments) async {
  //   var res =
  //       await httpRequest1.get('/truck/scale', data: resultArguments.toJson());
  //   return Result.fromJson(res, ScaleReceipt.fromJson);
  // }
}
