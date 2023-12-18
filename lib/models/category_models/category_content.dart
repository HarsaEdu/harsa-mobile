class CategoryCardModel {
  final String title;
  final String subtitle;
  final double rating;
  final String imageUrl;

  CategoryCardModel({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.imageUrl,
  });
}

class CheckCategory {
  final int code;
  final String message;
  final List<CategoryListData> data;
  final Pagination pagination;

  CheckCategory({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory CheckCategory.fromJson(Map<String, dynamic> json) => CheckCategory(
        code: json["code"],
        message: json["message"],
        data: List<CategoryListData>.from(
            json["data"].map((x) => CategoryListData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class CategoryListData {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final Category user;
  final Category category;

  CategoryListData({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.user,
    required this.category,
  });

  factory CategoryListData.fromJson(Map<String, dynamic> json) =>
      CategoryListData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        imageUrl: json["image_url"],
        rating: json["rating"]?.toDouble(),
        user: Category.fromJson(json["user"]),
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image_url": imageUrl,
        "rating": rating,
        "user": user.toJson(),
        "category": category.toJson(),
      };
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
