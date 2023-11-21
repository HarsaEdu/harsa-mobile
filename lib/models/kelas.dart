class Kelas {
  final List<KelasData> data;

  Kelas({required this.data});

  factory Kelas.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List<dynamic>? ?? [];
    var dataList = list.map((i) => KelasData.fromJson(i)).toList();
    return Kelas(data: dataList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class KelasData {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final int enrolled;
  final double rating;
  final DateTime createdAt;
  final DateTime updatedAt;
  final User user;
  final Category category;
  final List<Module> modules;

  KelasData({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.enrolled,
    required this.rating,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.category,
    required this.modules,
  });

  factory KelasData.fromJson(Map<String, dynamic> json) {
    return KelasData(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      enrolled: json['enrolled'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at']) ?? DateTime.now(),
      user: User.fromJson(json['user'] ?? {}),
      category: Category.fromJson(json['category'] ?? {}),
      modules: (json['modules'] as List<dynamic>?)?.map((x) => Module.fromJson(x)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'enrolled': enrolled,
      'rating': rating,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'user': user.toJson(),
      'category': category.toJson(),
      'modules': modules.map((m) => m.toJson()).toList(),
    };
  }
}

class Module {
  final int id;
  final String title;
  final int order;
  final String type;
  final List<SubModule> subModules;

  Module({
    required this.id,
    required this.title,
    required this.order,
    required this.type,
    required this.subModules,
  });

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json['id'],
      title: json['title'],
      order: json['order'],
      type: json['type'],
      subModules: (json['sub_modules'] as List<dynamic>?)?.map((x) => SubModule.fromJson(x)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'order': order,
      'type': type,
      'sub_modules': subModules.map((s) => s.toJson()).toList(),
    };
  }
}

class SubModule {
  final int id;
  final String title;
  final String type;

  SubModule({
    required this.id,
    required this.title,
    required this.type,
  });

  factory SubModule.fromJson(Map<String, dynamic> json) {
    return SubModule(
      id: json['id'],
      title: json['title'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
    };
  }
}

class User {
  final int id;
  final String email;
  final Role role;

  User({
    required this.id,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      role: Role.fromJson(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'role': role.toJson(),
    };
  }
}

class Role {
  final int id;
  final String name;

  Role({
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
