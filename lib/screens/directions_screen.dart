import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProviderURL>(context);

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(
                CupertinoIcons.globe,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scanListProvider.scans[i].valor),
              subtitle: Text(scanListProvider.scans[i].id.toString()),
              trailing: Icon(CupertinoIcons.arrow_right,
                  color: Theme.of(context).primaryColor),
              onTap: () {
                launchUrl(context, scanListProvider.scans[i]);
              },
            ));
  }
}
