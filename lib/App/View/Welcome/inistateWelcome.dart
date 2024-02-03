import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/api_operations.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/util/Route/go.dart';

class InistateWelcome {
  static Future inis() async {
    if (userid.read('iduser') == null) {
      return Future(() => Go.push(const ScreenSignin()));
    } else {
      return ApiOperation.getuserData(
        int.parse(userid.read('iduser')),
      );
    }
  }
}
