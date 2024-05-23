import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<dynamic> launchURL(String urls) async {
  Uri url = Uri.parse(urls); // Replace this with your desired URL
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    Fluttertoast.showToast(msg: 'Failed to launch');
  }
}
