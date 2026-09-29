import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigasi/app_routes.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(const NusantaraCerdasApp());
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Nusantara Cerdas Mobile',

      // Route awal
      initialRoute: AppRoutes.home,

      // Route biasa
      routes: AppRoutes.daftarRoute(),

      // Route dengan arguments
      onGenerateRoute: AppRoutes.bentukRoute,

      // Route yang tidak ditemukan
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}