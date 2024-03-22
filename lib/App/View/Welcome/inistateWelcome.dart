import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/util/Route/go.dart';

class InistateWelcome {
  static Future inis() async {
    try {
      if (userid.read('iduser') == null) {
        return Future(() => Go.push(const ScreenSignin()));
      } else {
        try {
          return ApiOperation.getuserData(
            int.parse(userid.read('iduser')),
          );
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print("error");
    }
  }
}
