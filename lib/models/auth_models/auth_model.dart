class AuthModel {
  int code;
  String message;
  AuthData data;

  AuthModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        code: json["code"],
        message: json["message"],
        data: AuthData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class AuthData {
  int id;
  String username;
  String roleName;
  String accessToken;
  String refreshToken;

  AuthData({
    required this.id,
    required this.username,
    required this.roleName,
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        id: json["id"],
        username: json["username"],
        roleName: json["role_name"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "role_name": roleName,
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
