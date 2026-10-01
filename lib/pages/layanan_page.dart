import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layanan'),

          bottom: const TabBar(
            tabs: [
              Tab(text: 'Perizinan'),
              Tab(text: 'Kesehatan'),
              Tab(text: 'Transportasi'),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // Tab Perizinan
            daftarLayanan(context, [
              {
                'nama': 'Izin Usaha',
                'dinas': 'Dinas Perizinan',
                'jam': '08.00 - 15.00',
                'keterangan': 'Pengurusan izin usaha.',
              },
              {
                'nama': 'Izin Bangunan',
                'dinas': 'Dinas PUPR',
                'jam': '08.00 - 15.00',
                'keterangan': 'Pengurusan izin bangunan.',
              },
              {
                'nama': 'Izin Reklame',
                'dinas': 'Dinas Perizinan',
                'jam': '08.00 - 14.00',
                'keterangan': 'Pengurusan izin reklame.',
              },
            ]),

            // Tab Kesehatan
            daftarLayanan(context, [
              {
                'nama': 'Puskesmas',
                'dinas': 'Dinas Kesehatan',
                'jam': '07.00 - 14.00',
                'keterangan': 'Layanan kesehatan puskesmas.',
              },
              {
                'nama': 'Kartu Kesehatan',
                'dinas': 'Dinas Kesehatan',
                'jam': '08.00 - 15.00',
                'keterangan': 'Pengurusan kartu kesehatan.',
              },
              {
                'nama': 'Ambulans',
                'dinas': 'Dinas Kesehatan',
                'jam': '24 Jam',
                'keterangan': 'Layanan ambulans.',
              },
            ]),

            // Tab Transportasi
            daftarLayanan(context, [
              {
                'nama': 'Kartu Transportasi',
                'dinas': 'Dinas Perhubungan',
                'jam': '08.00 - 15.00',
                'keterangan': 'Kartu transportasi kota.',
              },
              {
                'nama': 'Pengaduan Jalan',
                'dinas': 'Dinas Perhubungan',
                'jam': '24 Jam',
                'keterangan': 'Laporan kerusakan jalan.',
              },
              {
                'nama': 'Informasi Angkutan',
                'dinas': 'Dinas Perhubungan',
                'jam': '08.00 - 16.00',
                'keterangan': 'Informasi angkutan kota.',
              },
            ]),
          ],
        ),
      ),
    );
  }

  // Membuat daftar layanan
  Widget daftarLayanan(
    BuildContext context,
    List<Map<String, String>> data,
  ) {
    return ListView.builder(
      itemCount: data.length,

      itemBuilder: (context, index) {
        final layanan = data[index];

        final nama = layanan['nama']!;

        return ListTile(
          leading: const Icon(Icons.article),

          title: Text(nama),

          subtitle: Text(layanan['dinas']!),

          // Tombol favorit
          trailing: Consumer<FavoritModel>(
            builder: (context, favorit, child) {
              final aktif = favorit.isFavorit(nama);

              return IconButton(
                onPressed: () {
                  if (aktif) {
                    context.read<FavoritModel>().batalTandai(nama);
                  } else {
                    context.read<FavoritModel>().tandai(nama);
                  }
                },

                icon: Icon(
                  aktif ? Icons.star : Icons.star_border,
                ),
              );
            },
          ),

          // Membuka halaman detail
          onTap: () async {
            final hasil = await Navigator.pushNamed(
              context,
              '/detail-layanan',
              arguments: layanan,
            );

            // Menampilkan hasil pengajuan
            if (hasil != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(hasil.toString()),
                ),
              );
            }
          },
        );
      },
    );
  }
}