import 'package:intl/intl.dart';

String convertToDateString(String timestampStr) {
  // Parse the timestamp string to DateTime object
  DateTime timestamp = DateTime.parse(timestampStr);

  // Format the DateTime object to desired date format
  String formattedDate = DateFormat('yy-MM-dd').format(timestamp);

  return formattedDate;
}

String calculateTimeDifference(DateTime initialDate) {
  // Get the current date and time
  DateTime currentDate = DateTime.now();

  // Calculate the difference
  Duration difference = currentDate.difference(initialDate);

  // Extracting the components of the duration
  int days = difference.inDays;
  int hours = difference.inHours.remainder(24);
  int minutes = difference.inMinutes.remainder(60);
  int seconds = difference.inSeconds.remainder(60);

  // Constructing the string representation
  // Constructing the string representation
  if (days > 0) {
    return '$days day${days > 1 ? 's' : ''}';
  } else if (hours > 0) {
    return '$hours hour${hours > 1 ? 's' : ''}';
  } else if (minutes > 0) {
    return '$minutes minute${minutes > 1 ? 's' : ''}';
  } else {
    return '$seconds second${seconds > 1 ? 's' : ''}';
  }
}

String gettime(dateString) {
  DateTime initialDate = DateTime.parse(dateString);
  return calculateTimeDifference(initialDate);
}
