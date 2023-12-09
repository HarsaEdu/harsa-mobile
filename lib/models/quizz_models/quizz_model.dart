class QuizzData {
    int id;
    String title;
    int progress;
    String description;
    int order;
    HistoryQuizz historyQuizz;
    Quizz quizz;

    QuizzData({
        required this.id,
        required this.title,
        required this.progress,
        required this.description,
        required this.order,
        required this.historyQuizz,
        required this.quizz,
    });

    factory QuizzData.fromJson(Map<String, dynamic> json) => QuizzData(
        id: json["id"],
        title: json["title"],
        progress: json["progress"],
        description: json["description"],
        order: json["order"],
        historyQuizz: HistoryQuizz.fromJson(json["history_quizz"]),
        quizz: Quizz.fromJson(json["quizz"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "progress": progress,
        "description": description,
        "order": order,
        "history_quizz": historyQuizz.toJson(),
        "quizz": quizz.toJson(),
    };
}

class HistoryQuizz {
    int historyQuizzId;
    bool isComplete;

    HistoryQuizz({
        required this.historyQuizzId,
        required this.isComplete,
    });

    factory HistoryQuizz.fromJson(Map<String, dynamic> json) => HistoryQuizz(
        historyQuizzId: json["history_quizz_id"],
        isComplete: json["is_complete"],
    );

    Map<String, dynamic> toJson() => {
        "history_quizz_id": historyQuizzId,
        "is_complete": isComplete,
    };
}

class Quizz {
    int id;
    int moduleId;
    String title;
    String description;
    int duration;
    DateTime createdAt;
    DateTime updatedAt;
    List<Question> questions;

    Quizz({
        required this.id,
        required this.moduleId,
        required this.title,
        required this.description,
        required this.duration,
        required this.createdAt,
        required this.updatedAt,
        required this.questions,
    });

    factory Quizz.fromJson(Map<String, dynamic> json) => Quizz(
        id: json["id"],
        moduleId: json["module_id"],
        title: json["title"],
        description: json["description"],
        duration: json["duration"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
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
    List<Option>? options;

    Question({
        required this.id,
        required this.question,
        required this.options,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
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
