import '../../../../util/Const/url.dart';
import 'package:http/http.dart' as http;

Future<void> upIsPresent(String id, bool value) async {
  final String apiUrl = '${UrlApp.host}Notification/pudatateTtime/$id';
  try {
    // You may need to adjust headers or body according to your API requirements
    final response = await http.put(Uri.parse(apiUrl));

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
}
