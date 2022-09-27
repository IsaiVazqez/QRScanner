import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/screens/home_screen.dart';
import 'package:qr_scanner/screens/mapa_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UiProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          // ignore: prefer_const_constructors
          'home': (_) => HomeScreen(),
          // ignore: prefer_const_constructors
          'mapa': (_) => MapScreen(),
        },
        theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 0, 0, 0)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.black, foregroundColor: Colors.white),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
    );
  }
}
