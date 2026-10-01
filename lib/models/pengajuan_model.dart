import 'package:flutter/foundation.dart';

class PengajuanModel extends ChangeNotifier {
  // Menyimpan daftar layanan yang sedang diajukan
  final List<String> _pengajuan = [];

  // Getter untuk jumlah pengajuan
  int get totalPengajuan => _pengajuan.length;

  // Getter untuk mengambil daftar pengajuan
  List<String> get daftarPengajuan => List.unmodifiable(_pengajuan);

  // Menambahkan layanan ke pengajuan
  void tambahPengajuan(String namaLayanan) {
    _pengajuan.add(namaLayanan);
    notifyListeners();
  }
}