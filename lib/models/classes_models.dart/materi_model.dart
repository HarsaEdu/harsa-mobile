class MateriModel {
  int id;
  String title;
  String description;
  double progress;
  int order;
  List<SubModule> subModules;
  List<Submission> submissions;
  List<Quiz> quizzes;

  MateriModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.progress,
      required this.order,
      required this.subModules,
      required this.submissions,
      required this.quizzes});

  factory MateriModel.fromJson(Map<String, dynamic> json) {
    return MateriModel(
      id: json['id'] ?? 0, // Memberikan nilai default 0 jika null
      title: json['title'] ?? '', // Memberikan string kosong jika null
      description: json['description'] ?? '',
      progress: (json['progress'] as num?)?.toDouble() ??
          0.0, // Konversi ke double, berikan default 0.0 jika null
      order: json['order'] ?? 0,
      subModules: (json['sub_modules'] as List<dynamic>?)
              ?.map((x) => SubModule.fromJson(x))
              .toList() ??
          [],
      submissions: (json['submissions'] as List<dynamic>?)
              ?.map((x) => Submission.fromJson(x))
              .toList() ??
          [],
      quizzes: (json['quizzes'] as List<dynamic>?)
              ?.map((x) => Quiz.fromJson(x))
              .toList() ??
          [],
    );
  }
}

class SubmissionAnswer {
  int id;
  String status;

  SubmissionAnswer({required this.id, required this.status});

  factory SubmissionAnswer.fromJson(Map<String, dynamic> json) {
    return SubmissionAnswer(
      id: json['id'],
      status: json['status'] ?? '',
    );
  }
}

class Submission {
  int id;
  String title;
  SubmissionAnswer submissionAnswer;
  bool isComplete;

  Submission(
      {required this.id,
      required this.title,
      required this.submissionAnswer,
      required this.isComplete});

  factory Submission.fromJson(Map<String, dynamic> json) {
    return Submission(
      id: json['id'],
      title: json['title'],
      submissionAnswer: SubmissionAnswer.fromJson(json['submission_answer']),
      isComplete: json['is_complete'],
    );
  }
}

class Quiz {
  int id;
  String title;
  int historyQuizId;
  bool isComplete;

  Quiz(
      {required this.id,
      required this.title,
      required this.historyQuizId,
      required this.isComplete});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'],
      title: json['title'],
      historyQuizId: json['history_quiz_id'],
      isComplete: json['is_complete'],
    );
  }
}

class SubModule {
  int id;
  String title;
  String type;
  bool isComplete;

  SubModule(
      {required this.id,
      required this.title,
      required this.type,
      required this.isComplete});

  factory SubModule.fromJson(Map<String, dynamic> json) {
    return SubModule(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      isComplete: json['is_complete'],
    );
  }
}
