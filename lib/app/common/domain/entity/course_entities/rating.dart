import 'dart:convert';

class Rating {
  final String id;
  final String content;
  final int value;
  final String name;
  final String? avatar;
  Rating({
    required this.id,
    required this.content,
    required this.value,
    required this.name,
    this.avatar,
  });

  Rating copyWith({
    String? id,
    String? content,
    int? value,
    String? name,
    String? avatar,
  }) {
    return Rating(
      id: id ?? this.id,
      content: content ?? this.content,
      value: value ?? this.value,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'value': value,
      'name': name,
      'avatar': avatar,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      id: map['id'] ?? '',
      content: map['content'] ?? '',
      value: map['value']?.toInt() ?? 0,
      name: map['name'] ?? '',
      avatar: map['avatar'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Rating.fromJson(String source) => Rating.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Rating(id: $id, content: $content, value: $value, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Rating &&
        other.id == id &&
        other.content == content &&
        other.value == value &&
        other.name == name &&
        other.avatar == avatar;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        value.hashCode ^
        name.hashCode ^
        avatar.hashCode;
  }
}
