import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        //String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //  '#3D8BEF', 'Cancel', false, ScanMode.QR);

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);

        scanListProvider.newScan('http');
      },
      child: const Icon(CupertinoIcons.qrcode),
    );
  }
}
