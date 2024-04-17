import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:app/App/Service/Api/Function/Put/user.dart';
import 'package:app/App/Service/Api/Function/api_operations.dart';
import 'package:app/App/View/Auth/Sign%20in/screensignin.dart';
import 'package:app/App/View/Home/import_home.dart';
import 'package:app/App/View/Welcome/Start/ScreennStart.dart';
import 'package:app/App/util/Route/go.dart';

class InistateWelcome {
  static Future inis() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      if (userid.read('iduser') == null) {
        return Future(() => Go.push(const ScreenStart()));
      } else {
        try {
          ApiPut.updatatoken(userid.read('iduser'))
              .then((value) => print('gettocent'));
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
