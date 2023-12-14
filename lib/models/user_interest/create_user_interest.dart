class CreateUserInterest {
  int code;
  String message;

  CreateUserInterest({
    required this.code,
    required this.message,
  });

  factory CreateUserInterest.fromJson(Map<String, dynamic> json) =>
      CreateUserInterest(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
