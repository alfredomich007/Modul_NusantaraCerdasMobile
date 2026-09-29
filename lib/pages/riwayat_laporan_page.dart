import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatelessWidget {
  const RiwayatLaporanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
      ),

      // Daftar laporan
      body: ListView(
        padding: const EdgeInsets.all(15),

        children: const [

          Card(
            child: ListTile(
              leading: Icon(Icons.report),
              title: Text('Jalan Rusak'),
              subtitle: Text(
                'Status: Diproses',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.report),
              title: Text('Lampu Jalan Mati'),
              subtitle: Text(
                'Status: Selesai',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: Icon(Icons.report),
              title: Text('Sampah Menumpuk'),
              subtitle: Text(
                'Status: Diproses',
              ),
            ),
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton:
          FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(
            const SnackBar(
              content: Text(
                'Membuat laporan baru',
              ),
            ),
          );
        },

        child: const Icon(Icons.add),
      ),

      // BottomAppBar
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround,

          children: [

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
          ],
        ),
      ),
    );
  }
}