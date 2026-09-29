import 'package:flutter/material.dart';

class DetailLayananPage extends StatelessWidget {
  final Map<String, String> data;

  const DetailLayananPage({
    super.key,
    required this.data, required String namaLayanan, required String dinas, required String jam, required String deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['nama']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text('Dinas: ${data['dinas']}'),

            const SizedBox(height: 10),

            Text('Jam: ${data['jam']}'),

            const SizedBox(height: 10),

            Text('Keterangan: ${data['keterangan']}'),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Mengirim pesan kembali
                  Navigator.pop(
                    context,
                    'Permohonan ${data['nama']} telah diajukan',
                  );
                },
                child: const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}