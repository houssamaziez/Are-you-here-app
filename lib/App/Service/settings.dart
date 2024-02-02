import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Settings extends GetxService {
  static inst() async {
    await GetStorage.init();
    // await userid.write('iduser', null);
  }
}
