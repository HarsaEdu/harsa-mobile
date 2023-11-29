class TransactionHistory {
  final int id;
  final String title;
  final String price;
  final String status;

  TransactionHistory(
    this.id,
    this.title,
    this.price,
    this.status,
  );

  factory TransactionHistory.fromJson(dynamic json) {
    return TransactionHistory(
      json['id'],
      json['title'],
      json['price'],
      json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "status": status,
      };
}
