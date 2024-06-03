import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:url_launcher/url_launcher_string.dart';

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

Future<void> launchGmail(String emailGot) async {
  final email = 'mailto:$emailGot';

  await launchUrlString(email);
}
