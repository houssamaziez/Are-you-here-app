import 'package:intl/intl.dart';

String convertToDateString(String timestampStr) {
  // Parse the timestamp string to DateTime object
  DateTime timestamp = DateTime.parse(timestampStr);

  // Format the DateTime object to desired date format
  String formattedDate = DateFormat('yy-MM-dd').format(timestamp);

  return formattedDate;
}
