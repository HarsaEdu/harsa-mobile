class Payment {
  final String id;
  final int userId;
  final int itemId;
  final String status;
  final String method;
  final String grossAmount;
  final String bankName;
  final String vaNumber;
  final String transactionTime;
  final String settlementTime;
  final String expiryTime;
  final Customer customer;
  final Item item;

  Payment({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.status,
    required this.method,
    required this.grossAmount,
    required this.bankName,
    required this.vaNumber,
    required this.transactionTime,
    required this.settlementTime,
    required this.expiryTime,
    required this.customer,
    required this.item,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      userId: json['user_id'],
      itemId: json['item_id'],
      status: json['status'],
      method: json['method'],
      grossAmount: json['gross_amount'],
      bankName: json['bank_name'],
      vaNumber: json['va_number'],
      transactionTime: json['transaction_time'],
      settlementTime: json['settlement_time'],
      expiryTime: json['expiry_time'],
      customer: Customer.fromJson(json['customer']),
      item: Item.fromJson(json['item']),
    );
  }
}

class Customer {
  final int id;
  final String name;
  final String username;
  final String email;

  Customer({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}

class Item {
  final int id;
  final String name;

  Item({
    required this.id,
    required this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
    );
  }
}
