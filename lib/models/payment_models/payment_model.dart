class Payment {
  final String id;
  final int userId;
  final int itemId;
  final String status;
  final String method;
  final String grossAmount;
  final String bankName;
  final String vaNumber;
  final String createdAt;
  final String updatedAt;
  final String expiredAt;
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
    required this.createdAt,
    required this.updatedAt,
    required this.expiredAt,
    required this.customer,
    required this.item,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'] ?? '359fc24f-b4fd-4f7c-90d0-b0415a06ddfc',
      userId: json['user_id'] ?? 2,
      itemId: json['item_id'] ?? 1,
      status: json['status'] ?? 'pending',
      method: json['method'] ?? 'bank_transfer',
      grossAmount: json['gross_amount'],
      bankName: json['bank_name'] ?? 'bca',
      vaNumber: json['va_number'] ?? '-',
      createdAt: json['created_at'] ?? "2023-12-11T00:17:30Z",
      updatedAt: json['updated_at'] ?? "2023-12-11T00:17:30Z",
      expiredAt: json['expired_at'] ?? "2023-12-11T00:17:30Z",
      customer: Customer.fromJson(json['customer']),
      item: Item.fromJson(json['item']),
    );
  }
}

class Customer {
  final int id;
  final String name;

  Customer({required this.id, required this.name});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? 1,
      name: json['name'] ?? 'Budi',
    );
  }
}

class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] ?? 1,
      name: json['name'] ?? 'Budi',
    );
  }
}
