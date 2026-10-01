import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/pengaturan_page.dart';
import '../pages/tentang_page.dart';


class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  // Menyimpan index halaman yang sedang aktif
  int halamanAktif = 0;

  // Tiga halaman utama aplikasi
  final halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Mengecek ukuran layar
    final bool layarLebar =
        MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      // =========================
      // NAVIGATION DRAWER
      // =========================
      drawer: NavigationDrawer(
        onDestinationSelected: (index) {
          // Menutup drawer terlebih dahulu
          Navigator.pop(context);

          // Beranda, Layanan, dan Warga
          if (index < 3) {
            setState(() {
              halamanAktif = index;
            });
          }

          // Pengaturan Kota
          else if (index == 3) {
            Navigator.pushNamed(
              context,
              '/pengaturan',
            );
          }

          // Tentang Aplikasi
          else if (index == 4) {
            Navigator.pushNamed(
              context,
              '/tentang',
            );
          }

          // Menu Keluar
          else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Menu Keluar dipilih',
                ),
              ),
            );
          }
        },

        children: const [
          // Judul drawer
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'Nusantara Cerdas',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Beranda
          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Beranda'),
          ),

          // Layanan
          NavigationDrawerDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.list_alt),
            label: Text('Layanan'),
          ),

          // Warga
          NavigationDrawerDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: Text('Warga'),
          ),

          Divider(),

          // Pengaturan
          NavigationDrawerDestination(
            icon: Icon(Icons.settings),
            label: Text('Pengaturan Kota'),
          ),

          // Tentang
          NavigationDrawerDestination(
            icon: Icon(Icons.info),
            label: Text('Tentang Aplikasi'),
          ),

          // Keluar
          NavigationDrawerDestination(
            icon: Icon(Icons.logout),
            label: Text('Keluar'),
          ),
        ],
      ),

      // =========================
      // ISI UTAMA
      // =========================
      body: Row(
        children: [
          // =========================
          // NAVIGATION RAIL
          // LAYAR BESAR
          // =========================
          if (layarLebar)
            NavigationRail(
              selectedIndex: halamanAktif,

              // Ketika menu dipilih
              onDestinationSelected: (index) {
                setState(() {
                  halamanAktif = index;
                });
              },

              // Menampilkan label
              labelType:
                  NavigationRailLabelType.all,

              // Daftar menu
              destinations: const [
                // Beranda
                NavigationRailDestination(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                  ),
                  label: Text('Beranda'),
                ),

                // Layanan
                NavigationRailDestination(
                  icon: Icon(
                    Icons.list_alt_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.list_alt,
                  ),
                  label: Text('Layanan'),
                ),

                // Warga dengan badge
                NavigationRailDestination(
                  icon: WargaBadgeIcon(),
                  selectedIcon: WargaBadgeIcon(
                    aktif: true,
                  ),
                  label: Text('Warga'),
                ),
              ],
            ),

          // =========================
          // HALAMAN AKTIF
          // =========================
          Expanded(
            child: halaman[halamanAktif],
          ),
        ],
      ),

      // =========================
      // NAVIGATION BAR
      // LAYAR KECIL
      // =========================
      bottomNavigationBar: layarLebar
          ? null
          : NavigationBar(
              selectedIndex: halamanAktif,

              // Ketika menu dipilih
              onDestinationSelected: (index) {
                setState(() {
                  halamanAktif = index;
                });
              },

              destinations: const [
                // Beranda
                NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                  ),
                  label: 'Beranda',
                ),

                // Layanan
                NavigationDestination(
                  icon: Icon(
                    Icons.list_alt_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.list_alt,
                  ),
                  label: 'Layanan',
                ),

                // Warga dengan badge
                NavigationDestination(
                  icon: WargaBadgeIcon(),
                  selectedIcon: WargaBadgeIcon(
                    aktif: true,
                  ),
                  label: 'Warga',
                ),
              ],
            ),
    );
  }
}


// ==========================================
// WIDGET BADGE PADA MENU WARGA
// ==========================================

class WargaBadgeIcon extends StatelessWidget {
  final bool aktif;

  const WargaBadgeIcon({
    super.key,
    this.aktif = false,
  });

  @override
  Widget build(BuildContext context) {
    // Mengambil hanya jumlah pengajuan
    final total = context.select<
        PengajuanModel,
        int
      >(
        (model) => model.totalPengajuan,
      );

    return Badge(
      // Badge hanya muncul jika ada pengajuan
      isLabelVisible: total > 0,

      // Jumlah pengajuan
      label: Text(
        '$total',
      ),

      // Icon Warga
      child: Icon(
        aktif
            ? Icons.person
            : Icons.person_outline,
      ),
    );
  }
}