import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';
import '../pages/pengaturan_page.dart';
import '../pages/tentang_page.dart';
import '../pages/riwayat_laporan_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() => _KerangkaNavigasiState();
}

class _KerangkaNavigasiState extends State<KerangkaNavigasi> {
  // Menyimpan halaman yang aktif
  int halamanAktif = 0;

  // Tiga halaman utama
  final halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Mengecek ukuran layar
    bool layarLebar = MediaQuery.of(context).size.width >= 600;

    return Scaffold(

      // Drawer
      drawer: NavigationDrawer(
        onDestinationSelected: (index) {
          // Tutup drawer terlebih dahulu
          Navigator.pop(context);

          if (index < 3) {
            setState(() {
              halamanAktif = index;
            });
          } else if (index == 3) {
            Navigator.pushNamed(context, '/pengaturan');
          } else if (index == 4) {
            Navigator.pushNamed(context, '/tentang');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Menu Keluar dipilih'),
              ),
            );
          }
        },

        children: const [
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

          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Beranda'),
          ),

          NavigationDrawerDestination(
            icon: Icon(Icons.list_alt_outlined),
            selectedIcon: Icon(Icons.list_alt),
            label: Text('Layanan'),
          ),

          NavigationDrawerDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: Text('Warga'),
          ),

          Divider(),

          NavigationDrawerDestination(
            icon: Icon(Icons.settings),
            label: Text('Pengaturan Kota'),
          ),

          NavigationDrawerDestination(
            icon: Icon(Icons.info),
            label: Text('Tentang Aplikasi'),
          ),

          NavigationDrawerDestination(
            icon: Icon(Icons.logout),
            label: Text('Keluar'),
          ),
        ],
      ),

      // Isi halaman
      body: Row(
        children: [
          // NavigationRail untuk layar besar
          if (layarLebar)
            NavigationRail(
              selectedIndex: halamanAktif,

              onDestinationSelected: (index) {
                setState(() {
                  halamanAktif = index;
                });
              },

              labelType: NavigationRailLabelType.all,

              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: Text('Beranda'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  selectedIcon: Icon(Icons.list_alt),
                  label: Text('Layanan'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: Text('Warga'),
                ),
              ],
            ),

          // Halaman aktif
          Expanded(
            child: halaman[halamanAktif],
          ),
        ],
      ),

      // NavigationBar untuk layar kecil
      bottomNavigationBar: layarLebar
          ? null
          : NavigationBar(
              selectedIndex: halamanAktif,

              onDestinationSelected: (index) {
                setState(() {
                  halamanAktif = index;
                });
              },

              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                NavigationDestination(
                  icon: Icon(Icons.list_alt_outlined),
                  selectedIcon: Icon(Icons.list_alt),
                  label: 'Layanan',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Warga',
                ),
              ],
            ),
    );
  }
}