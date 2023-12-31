class UserCoursesModel {
  int code;
  String message;
  List<UserCoursesData> data;
  Pagination pagination;

  UserCoursesModel({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory UserCoursesModel.fromJson(Map<String, dynamic> json) =>
      UserCoursesModel(
        code: json["code"],
        message: json["message"],
        data: List<UserCoursesData>.from(
            json["data"].map((x) => UserCoursesData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class UserCoursesData {
  int courseTrackingId;
  int courseId;
  String title;
  String description;
  Intructur intructur;
  int studentId;
  String imageUrl;
  String status;
  double progress;
  DateTime createdAt;

  UserCoursesData({
    required this.courseTrackingId,
    required this.courseId,
    required this.title,
    required this.description,
    required this.intructur,
    required this.studentId,
    required this.imageUrl,
    required this.status,
    required this.progress,
    required this.createdAt,
  });

  factory UserCoursesData.fromJson(Map<String, dynamic> json) =>
      UserCoursesData(
        courseTrackingId: json["course_tracking_id"],
        courseId: json["course_id"],
        title: json["title"],
        description: json["description"],
        intructur: Intructur.fromJson(json["intructur"]),
        studentId: json["student_id"],
        imageUrl: json["image_url"],
        status: json["status"],
        progress: json["progress"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "course_tracking_id": courseTrackingId,
        "course_id": courseId,
        "title": title,
        "description": description,
        "intructur": intructur.toJson(),
        "student_id": studentId,
        "image_url": imageUrl,
        "status": status,
        "progress": progress,
        "created_at": createdAt.toIso8601String(),
      };
}

class Intructur {
  int id;
  String name;
  String job;
  String imageUrl;

  Intructur({
    required this.id,
    required this.name,
    required this.job,
    required this.imageUrl,
  });

  factory Intructur.fromJson(Map<String, dynamic> json) => Intructur(
        id: json["id"],
        name: json["name"],
        job: json["job"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "job": job,
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
