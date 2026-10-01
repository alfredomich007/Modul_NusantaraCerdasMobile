import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation/app_routes.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),

        children: [
          const Center(
            child: Icon(
              Icons.person,
              size: 80,
            ),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              'Identitas Warga',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Judul layanan favorit
          const Text(
            'Layanan Favorit',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Daftar favorit
          Consumer<FavoritModel>(
            builder: (context, favorit, child) {
              if (favorit.daftarFavorit.isEmpty) {
                return const Card(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Belum ada layanan favorit.',
                    ),
                  ),
                );
              }

              return Column(
                children: favorit.daftarFavorit.map((nama) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.star),
                      title: Text(nama),
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 20),

          // Tombol riwayat laporan
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.riwayatLaporan,
              );
            },
            child: const Text('Riwayat Laporan'),
          ),
        ],
      ),
    );
  }
}