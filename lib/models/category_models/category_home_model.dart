class WelcomeCategory {
    final int code;
    final String message;
    final List<CategoryData> data;
    final Pagination pagination;

    WelcomeCategory({
        required this.code,
        required this.message,
        required this.data,
        required this.pagination,
    });

    factory WelcomeCategory.fromJson(Map<String, dynamic> json) => WelcomeCategory(
        code: json["code"],
        message: json["message"],
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class CategoryData {
    final int id;
    final String name;
    final String description;
    final String image;
    final String icon;
    final DateTime createdAt;
    final DateTime updatedAt;
    final dynamic deleteAt;

    CategoryData({
        required this.id,
        required this.name,
        required this.description,
        required this.image,
        required this.icon,
        required this.createdAt,
        required this.updatedAt,
        required this.deleteAt,
    });

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deleteAt: json["delete_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "delete_at": deleteAt,
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
