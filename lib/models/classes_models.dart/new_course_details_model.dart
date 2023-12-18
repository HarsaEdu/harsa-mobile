class CourseData {
  bool isSubscription;
  CourseTracking courseTracking;
  Course course;
  List<Section> sections;

  CourseData({
    required this.isSubscription,
    required this.courseTracking,
    required this.course,
    required this.sections,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        isSubscription: json['is_subscription'],
        courseTracking: CourseTracking.fromJson(json['course_tracking']),
        course: Course.fromJson(json['course']),
        sections: List<Section>.from(
            json['sections'].map((x) => Section.fromJson(x))),
      );
}

class Course {
  int id;
  String title;
  String description;
  Instructor instructor;
  String imageUrl;
  int enrolled;
  double rating;
  int totalModules;
  List<Feedback> feedback;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.instructor,
    required this.imageUrl,
    required this.enrolled,
    required this.rating,
    required this.totalModules,
    required this.feedback,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        instructor: Instructor.fromJson(json['intructur']),
        imageUrl: json['image_url'],
        enrolled: json['enrolled'],
        rating: (json['rating'] as num?)?.toDouble() ??
          0.0,
        totalModules: json['total_modules'],
        feedback: List<Feedback>.from(
            json['feedback'].map((x) => Feedback.fromJson(x))),
      );
}

class Instructor {
  int id;
  String name;
  String job;
  String imageUrl;

  Instructor({
    required this.id,
    required this.name,
    required this.job,
    required this.imageUrl,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json['id'],
        name: json['name'],
        job: json['job'],
        imageUrl: json['image_url'],
      );
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
        id: json['id'],
        studentId: json['student_id'],
        progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
        status: json['status'],
      );
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
        id: json['id'],
        title: json['title'],
        order: json['order'],
        modules:
            List<Module>.from(json['modules'].map((x) => Module.fromJson(x))),
      );
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
        id: json['id'],
        title: json['title'],
        description: json['description'],
        order: json['order'],
        progress: (json['progress'] as num?)?.toDouble() ??
          0.0, 
      );
}

class Feedback {
  int id;
  double rating;
  String content;
  FeedbackUser user;
  DateTime createdAt;
  DateTime updatedAt;

  Feedback({
    required this.id,
    required this.rating,
    required this.content,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json['id'],
        rating: (json['rating'] as num?)?.toDouble() ??
          0.0, 
        content: json['content'],
        user: FeedbackUser.fromJson(json['user']),
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
}

class FeedbackUser {
  int id;
  String name;
  String imageUrl;

  FeedbackUser({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory FeedbackUser.fromJson(Map<String, dynamic> json) => FeedbackUser(
        id: json['id'],
        name: json['name'],
        imageUrl: json['image_url'],
      );
}
