class UlasanModel {
  final String fotoUrl;
  final String namaPengguna;
  final String waktu;
  String teksUlasan;
  double rating;
  final bool isUserReview;

  UlasanModel({
    required this.fotoUrl,
    required this.namaPengguna,
    required this.waktu,
    required this.teksUlasan,
    required this.rating,
    this.isUserReview = false,
  });
}
