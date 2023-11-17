class Inbox {
  final List<InboxItem> data;

  Inbox({required this.data});

  factory Inbox.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<InboxItem> dataList = list.map((i) => InboxItem.fromJson(i)).toList();
    return Inbox(data: dataList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class InboxItem {
  final int id;
  final String title;
  final String? profilepic;
  final String subtitle;
  final String desc;

  InboxItem({
    required this.id,
    required this.title,
     this.profilepic,
    required this.subtitle,
    required this.desc,
  });

  factory InboxItem.fromJson(Map<String, dynamic> json) {
    return InboxItem(
      id: json['id'],
      title: json['title'],
      profilepic: json['profile_pic'],
      subtitle: json['subtitle'],
      desc: json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'profile_pic': profilepic,
      'subtitle': subtitle,
      'desc': desc,
    };
  }
}
