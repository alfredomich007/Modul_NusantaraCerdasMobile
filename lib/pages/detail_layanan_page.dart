import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class DetailLayananPage extends StatefulWidget {
  final Map<String, String> data;

  const DetailLayananPage({
    super.key,
    required this.data,
  });

  @override
  State<DetailLayananPage> createState() =>
      _DetailLayananPageState();
}

class _DetailLayananPageState
    extends State<DetailLayananPage> {

  // Menyimpan status proses pengajuan
  bool sedangMengirim = false;

  Future<void> ajukanPermohonan() async {
    // Mengubah status menjadi sedang mengirim
    setState(() {
      sedangMengirim = true;
    });

    // Simulasi proses pengiriman
    await Future.delayed(
      const Duration(seconds: 2),
    );

    // Cek apakah halaman masih aktif
    if (!mounted) return;

    // Menambahkan layanan ke PengajuanModel
    context.read<PengajuanModel>().tambahPengajuan(
      widget.data['nama']!,
    );

    // Mengembalikan hasil ke halaman sebelumnya
    Navigator.pop(
      context,
      'Permohonan ${widget.data['nama']} telah diajukan',
    );
  }

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
              widget.data['nama']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              'Dinas: ${widget.data['dinas']}',
            ),

            const SizedBox(height: 10),

            Text(
              'Jam: ${widget.data['jam']}',
            ),

            const SizedBox(height: 10),

            Text(
              'Keterangan: ${widget.data['keterangan']}',
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                // Tombol tidak bisa ditekan lagi ketika proses berlangsung
                onPressed: sedangMengirim
                    ? null
                    : ajukanPermohonan,

                child: sedangMengirim
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Ajukan Permohonan',
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}