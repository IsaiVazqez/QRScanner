import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:qr_scanner/widgets/scan_tiles.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScanTiles(tipo: 'geo');
  }
}
