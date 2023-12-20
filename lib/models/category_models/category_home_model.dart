class Categories {
  Categories({
    required this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  List<Category> categories;

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.icon,
    required this.createdAt,
    required this.updatedAt,
    required this.deleteAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        icon: json["icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deleteAt: json["delete_at"],
      );

  DateTime createdAt;
  dynamic deleteAt;
  String description;
  String icon;
  int id;
  String image;
  String name;
  DateTime updatedAt;

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
