import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> addLikeToPost(String postId, String userId) async {
  final String apiUrl =
      'https://houssamaziez.com/api/post/likse/$postId/$userId';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      // You can add headers if required
      headers: {
        'Authorization': 'Bearer YourAuthToken',
      },
    );

    if (response.statusCode == 200) {
      // Successful request, you might handle the response if needed
      print('Like added successfully');
    } else {
      // Request failed, handle the error
      print('Failed to add like. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Exception occurred during the request
    print('Error: $e');
  }
}

Future<bool> isUserLikedPost(String postId, String userId) async {
  final url =
      'https://houssamaziez.com/api/post/islikse/$postId/$userId'; // Replace with your actual API endpoint URL

  var response = await http.post(Uri.parse(url));

  if (response.statusCode == 200) {
    final responseData = json.decode(response.body);
    return responseData['message'];
  } else {
    print('error');
    return false;
  }
}
