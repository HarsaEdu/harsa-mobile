class Welcome {
  final int code;
  final String message;
  final List<Datum> data;
  final Pagination pagination;

  Welcome({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Datum {
  final int id;
  final String title;
  final String description;
  final int price;
  final String image;
  final int duration;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.duration,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "duration": duration,
      };
}

class Pagination {
  final int offset;
  final int limit;
  final int total;

  Pagination({
    required this.offset,
    required this.limit,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
      };
}
