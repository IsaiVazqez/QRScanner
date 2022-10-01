import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);

    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, i) => ListTile(
              leading: Icon(
                tipo == 'geo' ? CupertinoIcons.map_fill : CupertinoIcons.globe,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(scans[i].valor),
              subtitle: Text(scans[i].id.toString()),
              trailing: Icon(CupertinoIcons.arrow_right,
                  color: Theme.of(context).primaryColor),
              onTap: () {},
            ));
  }
}
