class Certificate {
  final int id;
  final String picture;
  final String title;
  final String subtitle;

  Certificate(
    this.id,
    this.picture,
    this.title,
    this.subtitle,
  );

  factory Certificate.fromJson(dynamic json) {
    return Certificate(
      json['id'],
      json['picture'],
      json['title'],
      json['subtitle'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "title": title,
        "subtitle": subtitle,
      };
}
