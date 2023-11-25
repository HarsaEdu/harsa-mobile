class ClassFollowed {
  final int id;
  final String picture;
  final String title;
  final String subtitle;

  ClassFollowed(
    this.id,
    this.picture,
    this.title,
    this.subtitle,
  );

  factory ClassFollowed.fromJson(dynamic json) {
    return ClassFollowed(
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
