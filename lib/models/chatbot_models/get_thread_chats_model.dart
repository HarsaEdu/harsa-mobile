class ThreadChatsModel {
  int code;
  String message;
  List<TopicMessagesData>? data;

  ThreadChatsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ThreadChatsModel.fromJson(Map<String, dynamic> json) =>
      ThreadChatsModel(
        code: json["code"],
        message: json["message"],
        data: List<TopicMessagesData>.from(
            json["data"]?.map((x) => TopicMessagesData.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
      };
}

class TopicMessagesData {
  String id;
  String role;
  String message;
  int createdAt;

  TopicMessagesData({
    required this.id,
    required this.role,
    required this.message,
    required this.createdAt,
  });

  factory TopicMessagesData.fromJson(Map<String, dynamic> json) =>
      TopicMessagesData(
        id: json["id"],
        role: json["role"],
        message: json["message"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "role": role,
        "message": message,
        "created_at": createdAt,
      };
}
