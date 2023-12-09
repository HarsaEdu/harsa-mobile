class CreateTopicModel {
  int code;
  String message;

  CreateTopicModel({
    required this.code,
    required this.message,
  });

  factory CreateTopicModel.fromJson(Map<String, dynamic> json) =>
      CreateTopicModel(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
