import 'dart:convert';

List<String> parseImageList(String jsonString) {
  // Decode the JSON string into a Dart list
  List<dynamic> parsedList = json.decode(jsonString);

  // Convert dynamic list to string list
  List<String> imageList = List<String>.from(parsedList);

  return imageList;
}
