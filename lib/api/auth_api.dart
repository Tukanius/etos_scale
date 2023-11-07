import 'package:etos_scale_windows/models/user.dart';
import 'package:etos_scale_windows/utils/http_request.dart';

// final httpRequest = HttpRequest("http://mine.etos.mn/aut/app");
final httpRequest = HttpRequest("http://192.168.1.8:30601/app");
final httpRequestSet = HttpRequest("http://192.168.1.8:30606/api");

class AuthApi {
  login(data) async {
    var res =
        await httpRequest.post('/auth/login', data: User.toAuthJson(data));

    return User.fromAuthJson(res as Map<String, dynamic>);
  }

  me() async {
    var res = await httpRequestSet.get('/auth/me');
    return User.fromJson(res as Map<String, dynamic>);
  }
}
