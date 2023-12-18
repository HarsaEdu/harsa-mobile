class Bank {
  final String name;
  final String accountType;
  final String accountNumber;
  final String imagePath;

  Bank(
      {required this.name,
      required this.accountType,
      required this.accountNumber,
      required this.imagePath});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      name: json['name'] as String,
      accountType: json['accountType'] as String,
      accountNumber: json['accountNumber'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}
