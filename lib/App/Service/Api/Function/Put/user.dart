import 'package:app/App/util/Const/url.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class ApiPut {
  static Future<void> updatatoken(String id) async {
    final String apiUrl = '${UrlApp.host}users/updattoken/$id';
    FirebaseMessaging.instance.getToken().then((value) async {
      try {
        // You may need to adjust headers or body according to your API requirements
        final response = await http.put(
          Uri.parse(apiUrl),
          // headers: {
          //   'Content-Type': 'application/json',
          //   // Add any necessary headers
          // },
          // If you need to send any data with the request, you can add it here
          body: {
            'tokennotification': value.toString(),
          },
        );

        if (response.statusCode == 200) {
          // Successful request
          print('Token updated successfully');
        } else {
          // Request failed
          print('Failed to update token. Status code: ${response.statusCode}');
        }
      } catch (error) {
        // Error occurred during request
        print('Error updating token: $error');
      }
    });
  }
}
