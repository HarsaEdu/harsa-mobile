class CourseDetailsModel {
  int code;
  String message;
  CourseDetailsData data;

  CourseDetailsModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) =>
      CourseDetailsModel(
        code: json["code"],
        message: json["message"],
        data: CourseDetailsData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class CourseDetailsData {
  bool isSubscription;
  CourseTracking courseTracking;
  Course course;
  List<Section> sections;

  CourseDetailsData({
    required this.isSubscription,
    required this.courseTracking,
    required this.course,
    required this.sections,
  });

  factory CourseDetailsData.fromJson(Map<String, dynamic> json) =>
      CourseDetailsData(
        isSubscription: json["is_subscription"],
        courseTracking: CourseTracking.fromJson(json["course_tracking"]),
        course: Course.fromJson(json["course"]),
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "is_subscription": isSubscription,
        "course_tracking": courseTracking.toJson(),
        "course": course.toJson(),
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

class Course {
  int id;
  String title;
  String description;
  Intructur intructur;
  String imageUrl;
  int enrolled;
  num rating;
  int totalModules;
  dynamic feedback;

  Course({
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

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        intructur: Intructur.fromJson(json["intructur"]),
        imageUrl: json["image_url"],
        enrolled: json["enrolled"],
        rating: json["rating"],
        totalModules: json["total_modules"],
        feedback: json["feedback"],
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
        "feedback": feedback,
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

class CourseTracking {
  int id;
  int studentId;
  double progress;
  String status;

  CourseTracking({
    required this.id,
    required this.studentId,
    required this.progress,
    required this.status,
  });

  factory CourseTracking.fromJson(Map<String, dynamic> json) => CourseTracking(
        id: json["id"],
        studentId: json["student_id"],
        progress: json["progress"]?.toDouble(),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "progress": progress,
        "status": status,
      };
}

class Section {
  int id;
  String title;
  int order;
  List<Module> modules;

  Section({
    required this.id,
    required this.title,
    required this.order,
    required this.modules,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        order: json["order"],
        modules:
            List<Module>.from(json["modules"].map((x) => Module.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "order": order,
        "modules": List<dynamic>.from(modules.map((x) => x.toJson())),
      };
}

class Module {
  int id;
  String title;
  String description;
  int order;
  double progress;

  Module({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    required this.progress,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        order: json["order"],
        progress: json["progress"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "order": order,
        "progress": progress,
      };
}
