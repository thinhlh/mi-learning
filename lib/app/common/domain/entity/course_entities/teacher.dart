import 'dart:convert';

class Teacher {
  final String id;
  final String name;
  final String avatar;
  Teacher({
    required this.id,
    required this.name,
    required this.avatar,
  });

  Teacher copyWith({
    String? id,
    String? name,
    String? avatar,
  }) {
    return Teacher(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) =>
      Teacher.fromMap(json.decode(source));

  @override
  String toString() => 'Teacher(id: $id, name: $name, avatar: $avatar)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Teacher &&
        other.id == id &&
        other.name == name &&
        other.avatar == avatar;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ avatar.hashCode;
}
