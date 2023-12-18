class CategoryCardModel {
  final String title;
  final String subtitle;
  final double rating;
  final String imageUrl;

  CategoryCardModel({
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.imageUrl,
  });
}

class CheckCategory {
  int code;
  String message;
  List<CategoryListData> data;
  Pagination pagination;

  CheckCategory({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory CheckCategory.fromJson(Map<String, dynamic> json) => CheckCategory(
        code: json["code"],
        message: json["message"],
        data: List<CategoryListData>.from(
            json["data"].map((x) => CategoryListData.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class CategoryListData {
  int courseId;
  String courseTitle;
  String courseDescription;
  String courseImage;
  double courseRating;
  String instructorName;

  CategoryListData({
    required this.courseId,
    required this.courseTitle,
    required this.courseDescription,
    required this.courseImage,
    required this.courseRating,
    required this.instructorName,
  });

  factory CategoryListData.fromJson(Map<String, dynamic> json) =>
      CategoryListData(
        courseId: json["course_id"],
        courseTitle: json["course_title"],
        courseDescription: json["course_description"],
        courseImage: json["course_image"],
        courseRating: json["course_rating"]?.toDouble(),
        instructorName: json["instructor_name"],
      );

  Map<String, dynamic> toJson() => {
        "course_id": courseId,
        "course_title": courseTitle,
        "course_description": courseDescription,
        "course_image": courseImage,
        "course_rating": courseRating,
        "instructor_name": instructorName,
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
