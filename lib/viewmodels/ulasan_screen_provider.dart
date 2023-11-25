import 'package:flutter/material.dart';
import 'package:harsa_mobile/models/ulasan_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class UlasanScreenProvider extends ChangeNotifier {
  final List<UlasanModel> _daftarUlasan = [
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
    UlasanModel(
      fotoUrl:
          'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
      namaPengguna: 'Ujang',
      waktu: '5 h lalu',
      teksUlasan: 'There are many variations',
      rating: 4.0,
      isUserReview: false,
    ),
  ];

  List<UlasanModel> get daftarUlasan => _daftarUlasan;

  double _rating = 0;
  final TextEditingController _komentarController = TextEditingController();
  final PanelController _panelController = PanelController();
  UlasanModel? _ulasanTerbaru;
  int? _editedIndex;

  double get rating => _rating;
  TextEditingController get komentarController => _komentarController;
  PanelController get panelController => _panelController;
  UlasanModel? get ulasanTerbaru => _ulasanTerbaru;
  int? get editedIndex => _editedIndex;

  set rating(double value) {
    _rating = value;
    notifyListeners(); 
  }

  void kirimUlasan() {
    if (_rating > 0 && _komentarController.text.isNotEmpty) {
      UlasanModel ulasanBaru = UlasanModel(
        fotoUrl:
            'https://t3.ftcdn.net/jpg/04/60/91/88/360_F_460918802_XVCymFr7MoziFpnInbTDvrlblYhvAOi2.jpg',
        namaPengguna: 'Asep',
        waktu: 'Baru saja',
        teksUlasan: _komentarController.text,
        rating: _rating,
        isUserReview: true,
      );

      _daftarUlasan.insert(0, ulasanBaru);

      _komentarController.clear();
      _rating = 0;

      notifyListeners();
      _panelController.close();
    }
  }

  void updateUlasanState() {
    notifyListeners();
  }

  void showEditPanel(UlasanModel ulasan, int index) {
    _ulasanTerbaru = ulasan;
    _editedIndex = index;
    _komentarController.text = _ulasanTerbaru!.teksUlasan;
    _rating = _ulasanTerbaru!.rating;

    _panelController.open();
    notifyListeners();
  }

  void editUlasan() {
    if (_ulasanTerbaru != null && _editedIndex != null) {
      _daftarUlasan[_editedIndex!] = UlasanModel(
        fotoUrl: _ulasanTerbaru!.fotoUrl,
        namaPengguna: _ulasanTerbaru!.namaPengguna,
        waktu: _ulasanTerbaru!.waktu,
        teksUlasan: _komentarController.text,
        rating: _rating,
        isUserReview: true,
      );

      updateUlasanState();
      _komentarController.clear();
      _rating = 0;
      _ulasanTerbaru = null;
      _editedIndex = null;

      notifyListeners();
      _panelController.close();
    }
  }

  void deleteUlasan(UlasanModel ulasan) {
    _daftarUlasan.remove(ulasan);
    updateUlasanState();
    _panelController.open();
  }
}
