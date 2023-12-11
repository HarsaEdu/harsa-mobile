class CreateProfileModel {
  int code;
  String message;
  String? errors;

  CreateProfileModel({
    required this.code,
    required this.message,
    required this.errors,
  });

  factory CreateProfileModel.fromJson(Map<String, dynamic> json) =>
      CreateProfileModel(
        code: json["code"],
        message: json["message"],
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "errors": errors,
      };
}
