import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrl(BuildContext context, ScanModel scan) async {
  final Uri url = Uri.parse(scan.valor);

  if (scan.tipo == 'http') {
    if (!await canLaunchUrl(url)) {
    } else {
      throw 'Could not launch $url';
    }
  } else {
    print('geo');
  }
}
