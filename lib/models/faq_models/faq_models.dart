class Faqmodel {
  int code;
  String message;
  List<Datum> data;
  Pagination pagination;

  Faqmodel({
    required this.code,
    required this.message,
    required this.data,
    required this.pagination,
  });

  factory Faqmodel.fromJson(Map<String, dynamic> json) => Faqmodel(
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
  String question;
  String answer;

  Datum({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
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
