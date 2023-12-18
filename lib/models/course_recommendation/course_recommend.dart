class CourseRecommendation {
  List<Recommendation> recommendations;

  CourseRecommendation({
    required this.recommendations,
  });

  factory CourseRecommendation.fromJson(Map<String, dynamic> json) =>
      CourseRecommendation(
        recommendations: List<Recommendation>.from(
            json["recommendations"].map((x) => Recommendation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommendations":
            List<dynamic>.from(recommendations.map((x) => x.toJson())),
      };
}

class Recommendation {
  int courseId;
  String courseTitle;
  String courseDescription;
  String courseImage;
  String instructorName;
  double predictedRating;

  Recommendation({
    required this.courseId,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.instructorName,
    required this.predictedRating,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
        courseId: json["course_id"],
        courseTitle: json["course_title"],
        courseDescription: json["course_description"],
        courseImage: json["course_image"],
        instructorName: json["instructor_name"],
        predictedRating: (json["course_rating"]).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "course_title": courseTitle,
        "course_description": courseDescription,
        "course_image": courseImage,
        "instructor_name": instructorName,
        "predicted_rating": predictedRating,
      };
}
