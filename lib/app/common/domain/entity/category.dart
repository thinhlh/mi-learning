import 'dart:convert';

class Category {
  final String id;
  final String title;
  final String background;
  Category({
    required this.id,
    required this.title,
    required this.background,
  });

  Category copyWith({
    String? id,
    String? title,
    String? background,
  }) {
    return Category(
      id: id ?? this.id,
      title: title ?? this.title,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'background': background,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      background: map['background'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() =>
      'Category(id: $id, title: $title, background: $background)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.id == id &&
        other.title == title &&
        other.background == background;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ background.hashCode;
}
