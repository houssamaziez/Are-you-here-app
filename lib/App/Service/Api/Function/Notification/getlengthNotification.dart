import 'package:app/App/Service/Api/Bdd/local/auth.dart';
import 'package:http/http.dart' as http;
import 'package:app/App/util/Const/url.dart';

Future<String> getlengthNotification() async {
  final response = await http.get(
      Uri.parse('${UrlApp.host}Notisfication/length=${userid.read('iduser')}'));
  return response.body.toString();
}

Future<String> removelangth() async {
  final response = await http.put(Uri.parse(
      '${UrlApp.host}Notisfication/userIsSeeAllNotification/${userid.read('iduser')}'));
  return response.body.toString();
}
