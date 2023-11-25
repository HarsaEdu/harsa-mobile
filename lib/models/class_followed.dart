class ClassFollowed {
  final int id;
  final String picture;
  final String title;
  final String subtitle;
  final String status;

  ClassFollowed(
    this.id,
    this.picture,
    this.title,
    this.subtitle,
    this.status,
  );

  factory ClassFollowed.fromJson(dynamic json) {
    return ClassFollowed(
      json['id'],
      json['picture'],
      json['title'],
      json['subtitle'],
      json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "title": title,
        "subtitle": subtitle,
        "status": status,
      };
}
