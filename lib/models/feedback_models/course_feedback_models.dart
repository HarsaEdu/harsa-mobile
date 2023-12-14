class CourseFeedbackModel {
  int code;
  String message;
  List<CourseFeedbackData> data;
  Pagination pagination;

  CourseFeedbackModel({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory CourseFeedbackModel.fromJson(Map<String, dynamic> json) =>
      CourseFeedbackModel(
        code: json["code"],
        message: json["message"],
        data: List<CourseFeedbackData>.from(
            json["data"].map((x) => CourseFeedbackData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class CourseFeedbackData {
  int id;
  int rating;
  String content;
  User user;
  DateTime createdAt;
  DateTime updatedAt;

  CourseFeedbackData({
    required this.id,
    required this.rating,
    required this.content,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseFeedbackData.fromJson(Map<String, dynamic> json) =>
      CourseFeedbackData(
        id: json["id"],
        rating: json["rating"],
        content: json["content"],
        user: User.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "content": content,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class User {
  int id;
  String name;
  String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
      };
}

class Pagination {
  int offset;
  int limit;
  int total;

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
