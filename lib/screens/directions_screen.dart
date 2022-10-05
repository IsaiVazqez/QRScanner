import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/utils/utils.dart';

import '../providers/scan_list_provider.dart';

class DirectionsPage extends StatelessWidget {
  const DirectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    return ListView.builder(
        itemCount: scanListProvider.scans.length,
        itemBuilder: (_, i) => Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              onDismissed: (DismissDirection direction) {
                Provider.of<ScanListProvider>(context, listen: false)
                    .deleteById(scanListProvider.scans[i].id!);
              },
              child: ListTile(
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
              ),
            ));
  }
}
