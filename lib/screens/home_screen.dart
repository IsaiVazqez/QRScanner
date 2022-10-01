import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/providers/services.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/screens/directions_screen.dart';
import 'package:qr_scanner/screens/maps_page.dart';
import 'package:qr_scanner/screens/scan_button.dart';
import 'package:qr_scanner/utils/utils.dart';
import 'package:qr_scanner/widgets/custom_navigatorbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false).deleteAll();
            },
            icon: const Icon(CupertinoIcons.trash),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider = Provider.of<ScanListProvider>(context);

    final scanListUrlProvider = Provider.of<ScanListProviderURL>(context);

    // final tempScan = ScanModel(valor: 'http://google.com');

    switch (currentIndex) {
      case 0:
        scanListProvider.loadSCansbyType('geo');
        return MapsPage();

      case 1:
        scanListUrlProvider.loadSCansbyType('http');
        return DirectionsPage();

      default:
        return MapsPage();
    }
  }
}
