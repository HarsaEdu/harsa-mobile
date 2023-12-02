class EWallet {
  final String name;
  final String accountNumber;
  final String imagePath;

  EWallet(
      {required this.name,
      required this.accountNumber,
      required this.imagePath});

  factory EWallet.fromJson(Map<String, dynamic> json) {
    return EWallet(
      name: json['name'] as String,
      accountNumber: json['accountNumber'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}
