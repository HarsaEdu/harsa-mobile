class UserThreadsModel {
  int code;
  String message;
  List<UserThreadsData>? data;

  UserThreadsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory UserThreadsModel.fromJson(Map<String, dynamic> json) =>
      UserThreadsModel(
        code: json["code"],
        message: json["message"],
        data: List<UserThreadsData>.from(
            json["data"]?.map((x) => UserThreadsData.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class UserThreadsData {
  String id;
  int userId;
  String topic;
  DateTime createdAt;
  DateTime updatedAt;

  UserThreadsData({
    required this.id,
    required this.userId,
    required this.topic,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserThreadsData.fromJson(Map<String, dynamic> json) =>
      UserThreadsData(
        id: json["id"],
        userId: json["user_id"],
        topic: json["topic"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "topic": topic,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
