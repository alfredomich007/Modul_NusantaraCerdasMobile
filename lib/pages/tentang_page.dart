import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Judul halaman
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),

      // Isi halaman
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // Icon aplikasi
              const Icon(
                Icons.location_city,
                size: 80,
              ),

              const SizedBox(height: 20),

              // Nama aplikasi
              const Text(
                'Nusantara Cerdas Mobile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              // Deskripsi
              const Text(
                'Aplikasi layanan warga Smart City '
                'untuk memudahkan masyarakat '
                'mendapatkan layanan publik.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              // Versi aplikasi
              const Text(
                'Versi 1.0.0',
              ),
            ],
          ),
        ),
      ),
    );
  }
}