import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> launchUrlForContact(String urls) async {
  Uri url = Uri.parse(urls); // Replace this with your desired URL
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    Fluttertoast.showToast(msg: 'Failed to launch');
  }
}

Future<void> launchDialPad(String phoneNumber) async {
  final Uri telUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(telUri)) {
    await launchUrl(telUri);
  } else {
    throw 'Could not launch $telUri';
  }
}

Future<void> launchGmail(String email) async {
  final Uri gmailLaunchUri = Uri(
    scheme: 'https',
    host: 'mail.google.com',
    path: '/mail/u/0/',
    queryParameters: {
      'view': 'cm',
      'fs': '1',
      'to': email,
    },
  );

  if (await canLaunchUrl(gmailLaunchUri)) {
    await launchUrl(gmailLaunchUri);
  } else {
    throw 'Could not launch $gmailLaunchUri';
  }
}
