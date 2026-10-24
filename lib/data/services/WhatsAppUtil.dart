
import 'package:url_launcher/url_launcher.dart';

class WhatApputil {
  
  static Future<void> openWhatsApp({
       required String phoneNumber,
    required String message,
  }) async {
    final Uri url = Uri.parse('https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}');

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw Exception(' Could not launch WhatsApp');
    }
  }
}