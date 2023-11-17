class Faq {
  final int id;
  final String question;
  final String answer;

  Faq(
    this.id,
    this.question,
    this.answer,
  );

  // Corrected factory constructor
  factory Faq.fromJson(dynamic json) {
    return Faq(
      json['id'],
      json['question'],
      json['answer'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answer": answer,
      };
}
