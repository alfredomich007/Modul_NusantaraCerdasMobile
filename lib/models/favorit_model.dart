import 'package:flutter/foundation.dart';

class FavoritModel extends ChangeNotifier {
  // Menyimpan nama layanan yang menjadi favorit
  final Set<String> _favorit = {};

  // Mengecek apakah layanan sudah menjadi favorit
  bool isFavorit(String namaLayanan) {
    return _favorit.contains(namaLayanan);
  }

  // Menambahkan layanan ke favorit
  void tandai(String namaLayanan) {
    _favorit.add(namaLayanan);
    notifyListeners();
  }

  // Menghapus layanan dari favorit
  void batalTandai(String namaLayanan) {
    _favorit.remove(namaLayanan);
    notifyListeners();
  }

  // Mengambil daftar layanan favorit
  Set<String> get daftarFavorit => _favorit;
}