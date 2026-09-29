import 'package:flutter/material.dart';

// Import semua halaman
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
  // Nama-nama route
  static const String home = '/';
  static const String beranda = '/beranda';
  static const String layanan = '/layanan';
  static const String warga = '/warga';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';

  // Route biasa
  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      // Halaman utama
      home: (context) => const KerangkaNavigasi(),

      // Halaman utama aplikasi
      beranda: (context) => const BerandaPage(),
      layanan: (context) => const LayananPage(),
      warga: (context) => const WargaPage(),

      // Halaman riwayat laporan
      riwayatLaporan: (context) => const RiwayatLaporanPage(),

      // Halaman pengaturan
      pengaturan: (context) => const PengaturanPage(),

      // Halaman tentang aplikasi
      tentang: (context) => const TentangPage(),
    };
  }

  // Route untuk halaman yang membutuhkan arguments
  static Route<dynamic>? bentukRoute(RouteSettings settings) {
    if (settings.name == detailLayanan) {
      final data = settings.arguments as Map<String, String>;

      return MaterialPageRoute(
        builder: (context) {
          return DetailLayananPage(
            namaLayanan: data['nama'] ?? '',
            dinas: data['dinas'] ?? '',
            jam: data['jam'] ?? '',
            deskripsi: data['deskripsi'] ?? '', data: {},
          );
        },
      );
    }

    return null;
  }

  // Jika route tidak ditemukan
  static Route<dynamic> routeTidakDikenal(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return RouteTidakDikenalPage(
          namaRoute: settings.name ?? 'Tidak diketahui',
        );
      },
    );
  }
}