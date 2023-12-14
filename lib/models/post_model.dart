class PostModel {
  int code;
  String message;
  String? data;

  PostModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
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
