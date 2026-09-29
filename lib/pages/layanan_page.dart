import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigasi/app_routes.dart';

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

        return ListTile(
          leading: const Icon(Icons.article),

          title: Text(layanan['nama']!),

          subtitle: Text(layanan['dinas']!),

          trailing: const Icon(Icons.arrow_forward_ios),

          // Membuka detail
          onTap: () async {
            final hasil = await Navigator.pushNamed(
              context,
              '/detail',
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