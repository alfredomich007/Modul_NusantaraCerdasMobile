import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/app_routes.dart';
import 'package:provider/provider.dart' as provider;

import 'models/favorit_model.dart';
import 'models/pengajuan_model.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(
    provider.MultiProvider(
      providers: [
        // Provider untuk layanan favorit
        provider.ChangeNotifierProvider(
          create: (_) => FavoritModel(),
        ),

        // Provider untuk pengajuan layanan
        provider.ChangeNotifierProvider(
          create: (_) => PengajuanModel(),
        ),
      ],

      // MaterialApp berada di dalam Provider
      child: const NusantaraCerdasApp(),
    ),
  );
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

      // Route tidak ditemukan
      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}