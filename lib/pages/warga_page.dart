import 'package:flutter/material.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 80,
            ),

            const SizedBox(height: 10),

            const Text(
              'Identitas Warga',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/riwayat',
                );
              },
              child: const Text('Riwayat Laporan'),
            ),
          ],
        ),
      ),
    );
  }
}