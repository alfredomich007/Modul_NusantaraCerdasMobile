import 'package:flutter/material.dart';

class RouteTidakDikenalPage extends StatelessWidget {

  final String? namaRoute;

  const RouteTidakDikenalPage({
    super.key,
    this.namaRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Tidak Ditemukan',
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.error_outline,
              size: 80,
            ),

            const SizedBox(height: 20),

            const Text(
              'Route tidak ditemukan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              namaRoute ?? 'Tidak diketahui',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Kembali',
              ),
            ),
          ],
        ),
      ),
    );
  }
}