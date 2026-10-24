import 'package:url_launcher/url_launcher.dart';

class Mailutil {

  static Future<void> sendEmail() async {
    // Use Uri.encodeComponent to safety format spaces and special characters
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'joseinformatico2015@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Hello from Flutter!',
        'body': 'This is a pre-filled email body.'
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
