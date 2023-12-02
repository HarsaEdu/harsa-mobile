class KartuKredit {
  final String accountType;
  final String accountNumber;
  final String imagePath;

  KartuKredit(
      {required this.accountType,
      required this.accountNumber,
      required this.imagePath});

  factory KartuKredit.fromJson(Map<String, dynamic> json) {
    return KartuKredit(
      accountType: json['accountType'] as String,
      accountNumber: json['accountNumber'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}
