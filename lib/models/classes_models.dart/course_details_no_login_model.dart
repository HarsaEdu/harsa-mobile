class CourseDetailsNoLoginModel {
  final int code;
  final String message;
  final CourseDetailsNoLoginData data;

  CourseDetailsNoLoginModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CourseDetailsNoLoginModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsNoLoginModel(
        code: json["code"],
        message: json["message"],
        data: CourseDetailsNoLoginData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class CourseDetailsNoLoginData {
  final int id;
  final String title;
  final String description;
  final Intructur intructur;
  final String imageUrl;
  final int enrolled;
  final num rating;
  final int totalModules;
  final List<Feedback>? feedback;

  CourseDetailsNoLoginData({
    required this.id,
    required this.title,
    required this.description,
    required this.intructur,
    required this.imageUrl,
    required this.enrolled,
    required this.rating,
    required this.totalModules,
    required this.feedback,
  });

  factory CourseDetailsNoLoginData.fromJson(Map<String, dynamic> json) =>
      CourseDetailsNoLoginData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        intructur: Intructur.fromJson(json["intructur"]),
        imageUrl: json["image_url"],
        enrolled: json["enrolled"],
        rating: json["rating"],
        totalModules: json["total_modules"],
        feedback: List<Feedback>.from(
            json["feedback"]?.map((x) => Feedback.fromJson(x)) ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "intructur": intructur.toJson(),
        "image_url": imageUrl,
        "enrolled": enrolled,
        "rating": rating,
        "total_modules": totalModules,
        "feedback": List<dynamic>.from(feedback?.map((x) => x.toJson()) ?? []),
      };
}

class Feedback {
  final int id;
  final num rating;
  final String content;
  final Intructur user;
  final DateTime createdAt;
  final DateTime updatedAt;

  Feedback({
    required this.id,
    required this.rating,
    required this.content,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        rating: json["rating"],
        content: json["content"],
        user: Intructur.fromJson(json["user"]),
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

class Intructur {
  final int id;
  final String name;
  final String imageUrl;
  final String? job;

  Intructur({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.job,
  });

  factory Intructur.fromJson(Map<String, dynamic> json) => Intructur(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "job": job,
      };
}
