class ModulQuizzData {
  int code;
  String message;
  Data data;

  ModulQuizzData({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ModulQuizzData.fromJson(Map<String, dynamic> json) =>
      ModulQuizzData(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  int moduleId;
  String title;
  String description;
  int duration;
  DateTime createdAt;
  DateTime updatedAt;
  List<Question> questions;

  Data({
    required this.id,
    required this.moduleId,
    required this.title,
    required this.description,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        moduleId: json["module_id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "module_id": moduleId,
        "title": title,
        "description": description,
        "duration": duration,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  int id;
  String question;
  List<Option> options;

  Question({
    required this.id,
    required this.question,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  int id;
  String value;

  Option({
    required this.id,
    required this.value,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
