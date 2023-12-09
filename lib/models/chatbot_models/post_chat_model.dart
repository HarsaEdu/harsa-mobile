class PostChatModel {
  int code;
  String message;
  String data;

  PostChatModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PostChatModel.fromJson(Map<String, dynamic> json) => PostChatModel(
        code: json["code"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data,
      };
}
