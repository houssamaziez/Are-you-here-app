import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  print(launchUri.toString()); // Helps to debug the actual URL being launched

  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    print('Could not launch $launchUri');
    if (!await canLaunchUrl(launchUri)) {
      print('Cannot launch URL, ensure the device is capable of making calls');
    }
  }
}
