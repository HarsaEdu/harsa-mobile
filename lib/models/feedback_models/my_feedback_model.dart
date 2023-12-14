class MyFeedbackModel {
  int code;
  String message;
  MyFeedbackData data;

  MyFeedbackModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory MyFeedbackModel.fromJson(Map<String, dynamic> json) =>
      MyFeedbackModel(
        code: json["code"],
        message: json["message"],
        data: MyFeedbackData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class MyFeedbackData {
  int id;
  int rating;
  String content;
  User user;
  DateTime createdAt;
  DateTime updatedAt;

  MyFeedbackData({
    required this.id,
    required this.rating,
    required this.content,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MyFeedbackData.fromJson(Map<String, dynamic> json) => MyFeedbackData(
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
