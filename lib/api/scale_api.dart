import 'package:etos_scale_windows/models/result.dart';
import 'package:etos_scale_windows/models/scale.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

// final httpRequest = HttpRequest("http://mine.etos.mn/sca/api");
// final httpRequest = HttpRequest("http://192.168.1.96:30606/api");
final httpRequest = HttpRequest("http://192.168.1.8:30606/api");

class ScaleApi {
  list(ResultArguments arguments) async {
    var res = await httpRequest.get('/truck/scale', data: arguments.toJson());

    return Result.fromJson(res, Scale.fromJson);
  }

  truck(data) async {
    var res = await httpRequest.post('/truck/scale', data: data);

    return Scale.fromJson(res);
  }
}
