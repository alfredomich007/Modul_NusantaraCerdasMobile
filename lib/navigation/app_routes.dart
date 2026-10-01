import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/detail_layanan_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/pengaturan_page.dart';
import '../pages/tentang_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  // Nama route
  static const String home = '/';
  static const String beranda = '/beranda';
  static const String layanan = '/layanan';
  static const String warga = '/warga';
  static const String detailLayanan = '/detail';
  static const String riwayatLaporan = '/riwayat';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';

  // Route biasa
  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      home: (context) => const KerangkaNavigasi(),
      beranda: (context) => const BerandaPage(),
      layanan: (context) => const LayananPage(),
      warga: (context) => const WargaPage(),
      riwayatLaporan: (context) => const RiwayatLaporanPage(),
      pengaturan: (context) => const PengaturanPage(),
      tentang: (context) => const TentangPage(),
    };
  }

  // Route detail layanan
  static Route<dynamic>? bentukRoute(
    RouteSettings settings,
  ) {
    if (settings.name == detailLayanan) {
      final data =
          settings.arguments as Map<String, String>;

      return MaterialPageRoute(
        builder: (context) {
          return DetailLayananPage(
            data: data,
          );
        },
      );
    }

    return null;
  }

  // Route tidak dikenal
  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        return RouteTidakDikenalPage(
          namaRoute: settings.name,
        );
      },
    );
  }
}