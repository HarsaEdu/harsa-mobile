class SubsDetail {
  int id;
  String title;
  String description;
  int price;
  String image;
  int duration;

  SubsDetail({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.duration,
  });

  factory SubsDetail.fromJson(Map<String, dynamic> json) => SubsDetail(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        image: json["image"],
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "image": image,
        "duration": duration,
      };
}
