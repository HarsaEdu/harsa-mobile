class QuizzData {
  int code;
  String message;
  List<Datum> data;
  Pagination pagination;

  QuizzData({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory QuizzData.fromJson(Map<String, dynamic> json) => QuizzData(
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Datum {
  int id;
  int moduleId;
  String title;
  String description;
  int duration;
  int numberQuestions;

  Datum({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.description,
    required this.duration,
    required this.numberQuestions,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        moduleId: json["module_id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        numberQuestions: json["number_questions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module_id": moduleId,
        "title": title,
        "description": description,
        "duration": duration,
        "number_questions": numberQuestions,
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
