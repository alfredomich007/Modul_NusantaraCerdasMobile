import 'package:flutter/material.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),

      body: ListView(
        children: [

          SwitchListTile(
            title: const Text(
              'Notifikasi',
            ),

            subtitle: const Text(
              'Aktifkan notifikasi aplikasi',
            ),

            value: true,

            onChanged: (value) {},
          ),

          const ListTile(
            leading: Icon(Icons.location_city),

            title: Text(
              'Kota',
            ),

            subtitle: Text(
              'Nusantara',
            ),
          ),

          const ListTile(
            leading: Icon(Icons.language),

            title: Text(
              'Bahasa',
            ),

            subtitle: Text(
              'Bahasa Indonesia',
            ),
          ),
        ],
      ),
    );
  }
}