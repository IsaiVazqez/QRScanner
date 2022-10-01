import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future launchUrl(BuildContext context, ScanModel scan) async {
  final url = scan.valor;

  if (scan.tipo! == 'http') {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}

Future openBrowserURL() async {
  final url = 'https://google.com';

  if (await canLaunch(url)) {
    await launch(url, forceSafariVC: true);
  } else {
    throw 'Could not launch $url';
  }
}
